# ask

A simple Bash command-line tool that sends prompts to an OpenAI-compatible LLM API and prints the response.

## Requirements

- curl
- jq

## Configuration

Before using the tool, set the following environment variables:

```bash
export ASK_API_URL="https://api.groq.com/openai/v1/chat/completions"
export ASK_MODEL="llama-3.3-70b-versatile"
export ASK_API_KEY="your-api-key-here"
```

## Usage

Basic usage:

```bash
ask "Who won the World Cup in 2022?"
```

Multiple arguments are combined into a single prompt:

```bash
ask "List the founding years of" "Germany" "Argentina" "Spain"
```

You can also use piped input:

```bash
cat script.sh | ask "Explain what this Bash script does step by step:"
```

Arguments and piped input can be used together:

```bash
echo "system load information" | ask "Summarize and explain this output:"
```

## Installation

```bash
git clone "https://github.com/CenkerEfeTahan/CE-350-CLI-Project.git"
chmod +x ask/ask
sudo cp ask/ask /usr/local/bin/ask
```

## Known Limitations

- No conversation memory (each request is independent)
- Output is plain text only (no formatting or streaming)
- Large inputs may hit model token limits
- Requires properly set environment variables

## License

MIT — see `LICENSE`
