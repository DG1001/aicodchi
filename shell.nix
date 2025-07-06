
{
  pkgs ? import <nixpkgs> {},
}:

pkgs.mkShell {
  buildInputs = with pkgs; [
    python3
    python3Packages.pip
    python3Packages.virtualenv
    git
    nodejs
    yarn
  ];

  shellHook = ''
    echo "🚀 Codchi Development Environment"
    echo "Setting up aider-chat..."
    
    # Create virtual environment if it doesn't exist
    if [ ! -d ".venv" ]; then
      python -m venv .venv
    fi
    
    # Activate virtual environment
    source .venv/bin/activate
    
    # Install aider-chat if not already installed
    if ! command -v aider &> /dev/null; then
      pip install aider-chat
    fi
    
    echo "✅ Environment ready!"
    echo "💡 Use 'aider' to start AI pair programming"
    echo "💡 Use 'code .' to open VSCode"
  '';
}
