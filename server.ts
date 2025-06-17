import { extname } from "https://deno.land/std@0.224.0/path/mod.ts";
import { contentType } from "https://deno.land/std@0.224.0/media_types/mod.ts";

Deno.serve(async (req) => {
  // Get the requested path, default to /index.html
  let pathname = new URL(req.url).pathname;
  if (pathname === "/") pathname = "/index.html";

  // Build the file path
  const filePath = `.${pathname}`;

  try {
    const file = await Deno.open(filePath, { read: true });
    // Guess content type from extension
    const ext = extname(filePath);
    const type = contentType(ext) || "application/octet-stream";
    return new Response(file.readable, {
      headers: { "content-type": type },
    });
  } catch (err) {
    // File not found or error
    return new Response("Not Found", { status: 404 });
  }
});

// dev_server.ts
// import { extname } from "https://deno.land/std@0.224.0/path/mod.ts";
// import { contentType } from "https://deno.land/std@0.224.0/media_types/mod.ts";
//
// // Which files/directories to watch for changes
// const WATCH_PATHS = ["src", "gleam.toml", "index.html", "build"];
//
// // Helper: Runs "gleam build"
// async function gleamBuild() {
//   console.log("[dev] Running gleam build...");
//   const gleam = Deno.run({
//     cmd: ["gleam", "build"],
//     stdout: "inherit",
//     stderr: "inherit",
//   });
//   const status = await gleam.status();
//   gleam.close();
//   if (!status.success) {
//     console.error("[dev] Gleam build failed.");
//     return false;
//   }
//   console.log("[dev] Gleam build succeeded.");
//   return true;
// }
//
// // Helper: Starts the HTTP server and returns the AbortController to stop it
// function startServer() {
//   const controller = new AbortController();
//   Deno.serve({ signal: controller.signal }, async (req) => {
//     let pathname = new URL(req.url).pathname;
//     if (pathname === "/") pathname = "/index.html";
//     const filePath = `.${pathname}`;
//     try {
//       const file = await Deno.open(filePath, { read: true });
//       const ext = extname(filePath);
//       const type = contentType(ext) || "application/octet-stream";
//       return new Response(file.readable, {
//         headers: { "content-type": type },
//       });
//     } catch {
//       return new Response("Not Found", { status: 404 });
//     }
//   });
//   console.log("[dev] Server running at http://localhost:8000");
//   return controller;
// }
//
// // --- Main dev loop ---
// let serverController: AbortController | null = null;
//
// async function devLoop() {
//   // Initial build
//   if (!(await gleamBuild())) {
//     console.log("[dev] Waiting for changes before retrying build...");
//   } else {
//     serverController = startServer();
//   }
//
//   const watcher = Deno.watchFs(WATCH_PATHS);
//   for await (const event of watcher) {
//     if (!event.paths.some((p) => p.endsWith(".swp") || p.endsWith("~"))) {
//       console.log("[dev] Change detected:", event.paths);
//       if (serverController) {
//         serverController.abort();
//         serverController = null;
//       }
//       if (await gleamBuild()) {
//         serverController = startServer();
//       } else {
//         console.log("[dev] Waiting for changes before retrying build...");
//       }
//     }
//   }
// }
//
// devLoop();
//
