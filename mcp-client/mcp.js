import 'dotenv/config';
import OpenAI from "openai";

const client = new OpenAI({ apiKey: process.env.OPENAI_API_KEY });

async function runMCP() {
    const response = await client.chat.completions.create({
        model: "gpt-3.5-turbo",
        messages: [
            { role: "system", content: "You can call MCP tools at " + process.env.MCP_URL + "/mcp.json" },
            { role: "user", content: "Create invoice for ACME amount 500" }
        ]
    });

    console.log(response.choices[0].message);
}

runMCP();
