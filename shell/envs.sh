# ====================
# Environment Variables
# ====================

export XDG_CONFIG_HOME=~/.config
export EDITOR=nvim
export DOCKER_BUILDKIT=1
export COMPOSE_DOCKER_CLI_BUILD=0
export ANDROID_HOME=/home/matsch/android-sdk
export CHROME_EXECUTABLE=/usr/bin/chromium
export JAVA_HOME=/usr/lib/jvm/java-17-openjdk
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:/usr/bin
export PATH=$PATH:~/go/bin
export PATH=$(echo $PATH | tr ":" "\n" | grep -v "Roaming\/npm" | tr "\n" ":")

[ -f "~/Files/Documents/.env" ] && source ~/Files/Documents/.env
