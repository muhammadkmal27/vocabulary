import { Project, SyntaxKind } from "ts-morph";
import fs from "fs";
import path from "path";
import { fileURLToPath } from "url";

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);
const ROOT_DIR = path.resolve(__dirname, "..");
const FRONTEND_DIR = path.join(ROOT_DIR, "frontend");
const ROADMAP_PATH = path.join(ROOT_DIR, "roadmap.md");

console.log("🔍 Scanning for Mockup UI (v3 Engines)...");

const project = new Project();
project.addSourceFilesAtPaths(path.join(FRONTEND_DIR, "src/app/**/*.tsx"));

const mockupFiles = new Set();
const scanDetails = [];

for (const sourceFile of project.getSourceFiles()) {
  const relativePath = path.relative(ROOT_DIR, sourceFile.getFilePath()).replace(/\\/g, "/");
  
  // Skip layout files or files that are not page views
  if (relativePath.includes("layout.tsx") || relativePath.includes("components/ui")) {
    continue;
  }

  const textContent = sourceFile.getText();
  const hasApiCall = textContent.includes("fetch(") ||
    textContent.includes("api.") ||
    textContent.includes("axios") ||
    textContent.includes("useAuth");

  let isMock = false;
  let reasons = [];

  // Engine 1: Static Mock Arrays
  // Find array declarations with mock/dummy data (e.g. const LANGUAGES = [...])
  const variableStatements = sourceFile.getVariableStatements();
  for (const statement of variableStatements) {
    for (const declaration of statement.getDeclarations()) {
      const name = declaration.getName();
      const initializer = declaration.getInitializer();
      if (initializer && initializer.getKind() === SyntaxKind.ArrayLiteralExpression) {
        const uppercaseOrMock = /^[A-Z_]+$/.test(name) || name.toLowerCase().includes("mock");
        if (uppercaseOrMock) {
          // If there's no api call fetching this specific variable, or if it is hardcoded profile languages
          if (!hasApiCall || relativePath.includes("profile/page.tsx")) {
            isMock = true;
            reasons.push(`[Engine 1: Static Mock Array] Variable '${name}' is hardcoded`);
          }
        }
      }
    }
  }

  // Engine 2: Empty Handlers (e.g. onClick={() => {}} or console.log/alert)
  const jsxAttributes = sourceFile.getDescendantsOfKind(SyntaxKind.JsxAttribute);
  for (const attr of jsxAttributes) {
    const attrName = attr.getNameNode().getText();
    if (attrName === "onClick" || attrName === "onSubmit" || attrName === "onChange") {
      const initializer = attr.getInitializer();
      if (initializer && initializer.getKind() === SyntaxKind.JsxExpression) {
        const expression = initializer.getExpression();
        if (expression) {
          const text = expression.getText();
          if (text.includes("console.log") || text === "() => {}" || text.includes("alert(")) {
            isMock = true;
            reasons.push(`[Engine 2: Empty Handler] Interactive attribute '${attrName}' has mock/empty expression`);
          }
        }
      }
    }
  }

  // Engine 3 & 4: Inline Hardcoded Data & Data-Display Without Fetch
  // If no API calls are made, check if we render typical statistics, prices, or static lists
  if (!hasApiCall) {
    const hasStatsOrPrices = /RM\s*\d+/i.test(textContent) || 
                             /\b\d{1,3}(,\d{3})+\b/.test(textContent) || 
                             /Jumlah\s+(Pengguna|Akaun|Transaksi|Bahasa)/i.test(textContent) ||
                             /Plan\s+Semasa/i.test(textContent);
    
    if (hasStatsOrPrices) {
      isMock = true;
      reasons.push(`[Engine 3/4: Inline Hardcoded Data & Display] Renders stats or pricing without API calls`);
    }
  }

  // Engine 5: Interactive Without API
  // Check if page contains Interactive components like Switch, Button, select, but has no API integration
  if (!hasApiCall) {
    const hasButtonsOrSwitches = textContent.includes("<Button") || 
                                 textContent.includes("<Switch") ||
                                 textContent.includes("<input");
    if (hasButtonsOrSwitches) {
      isMock = true;
      reasons.push(`[Engine 5: Interactive Without API] Contains interactive components but no API integration`);
    }
  }

  if (isMock) {
    mockupFiles.add(relativePath);
    scanDetails.push({ file: relativePath, reasons });
    console.log(`⚠️ Mockup detected: ${relativePath}\n   -> ${reasons.join("\n   -> ")}`);
  }
}

if (mockupFiles.size === 0) {
  console.log("✅ No mockup UIs detected! All components seem functional.");
  process.exit(0);
}

// Update roadmap.md
console.log("\n📝 Updating roadmap.md...");
let roadmapContent = fs.readFileSync(ROADMAP_PATH, "utf-8");
const SUB_FASA_TITLE = "### Sub-Fasa 13: Auto-Detection & Mockup Integration";

if (!roadmapContent.includes(SUB_FASA_TITLE)) {
  console.log("Creating Sub-Fasa 13 in roadmap.md...");
  const newSection = [
    "",
    SUB_FASA_TITLE,
    "",
    "| # | Task | Status | Dependency |",
    "|---|------|--------|------------|",
    "",
  ].join("\n");
  roadmapContent = roadmapContent.replace(
    "## 📊 Progress Keseluruhan",
    `${newSection}\n## 📊 Progress Keseluruhan`
  );
}

const subFasa13Regex = /(### Sub-Fasa 13: Auto-Detection & Mockup Integration\s*\n(?:\s*\n)*\|[^\n]+\|\s*\n\|[-|\s]+\|\s*\n)((?:\|[^\n]+\|\s*\n)*)/;
const match = roadmapContent.match(subFasa13Regex);

if (match) {
  const tableHeader = match[1];
  const existingRows = match[2];

  const existingIds = [...existingRows.matchAll(/\|\s*(13\.\d+)\s*\|/g)].map(m => parseFloat(m[1]));
  let nextNum = existingIds.length > 0 ? Math.max(...existingIds.map(id => {
    const parts = id.toString().split(".");
    return parseInt(parts[1] || "0");
  })) + 1 : 1;

  let newRows = "";
  let addedCount = 0;

  for (const file of mockupFiles) {
    const normalizedFile = file.replace(/\\/g, "/");
    if (!existingRows.includes(normalizedFile) && !existingRows.includes(file)) {
      const newRow = `| 13.${nextNum} | Wire up API for \`${normalizedFile}\` | ⬜ | - |\n`;
      newRows += newRow;
      nextNum++;
      addedCount++;
    }
  }

  if (addedCount > 0) {
    const updatedSection = tableHeader + existingRows + newRows;
    roadmapContent = roadmapContent.replace(tableHeader + existingRows, updatedSection);

    const totalTasks = existingIds.length + addedCount;
    const completedTasks = [...existingRows.matchAll(/\| ✅ \|/g)].length;
    const progressRegex = /(\|\s*\*\*Fasa 3\*\*\s*\|\s*Sub-Fasa 13: Mockups\s*\|)\s*[^\|]+\|/;
    if (progressRegex.test(roadmapContent)) {
      roadmapContent = roadmapContent.replace(
        progressRegex,
        `$1 ${completedTasks === totalTasks ? "✅" : "🔄"} ${completedTasks}/${totalTasks}      |`
      );
    }

    const allStatusMatches = [...roadmapContent.matchAll(/[✅🔄⬜]\s*(\d+)\/(\d+)/g)];
    let totalDone = 0;
    let totalAll = 0;
    for (const sm of allStatusMatches) {
      totalDone += parseInt(sm[1]);
      totalAll += parseInt(sm[2]);
    }
    const totalRegex = /(\|\s*\|\s*\*\*Total\*\*\s*\|)\s*\*\*[^*]+\*\*\s*\|/;
    if (totalRegex.test(roadmapContent)) {
      roadmapContent = roadmapContent.replace(
        totalRegex,
        `$1 **💪 ${totalDone}/${totalAll}** |`
      );
    }

    fs.writeFileSync(ROADMAP_PATH, roadmapContent, "utf-8");
    console.log(`✅ Successfully added ${addedCount} mockup task(s) to roadmap.md!`);
  } else {
    console.log("ℹ️ All detected mockups are already tracked in roadmap.md.");
  }
} else {
  console.log("⚠️ Could not parse Sub-Fasa 13 table in roadmap.md. Skipping update.");
}

console.log("🎉 Done!");
