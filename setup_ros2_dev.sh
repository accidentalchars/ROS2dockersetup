#!/bin/bash

# ROS2-Entwicklungsumgebung vorbereiten
echo "Erstelle ROS2-Entwicklungsverzeichnis..."

# x11-Zugriff erlauben für GUI
xhost +local:docker > /dev/null 2>&1

# Verzeichnisstruktur erstellen
mkdir -p ros2_dev/workspace

# .bashrc erstellen
cat > ros2_dev/.bashrc << 'EOF'
# ROS2 Umgebung
source /opt/ros/jazzy/setup.bash

# Workspace sourcing (falls vorhanden)
if [ -f ~/ros2_ws/install/setup.bash ]; then
    source ~/ros2_ws/install/setup.bash
fi

# Aliase
alias eb='nano /root/.bashrc'
alias sb='source /root/.bashrc'
alias cb='colcon build'
alias cbs='colcon build --symlink-install'
alias cbt='colcon build --cmake-args -DCMAKE_BUILD_TYPE=Release'

# Prompt anpassen
PS1='\[\033[01;32m\][ROS2]\[\033[00m\] \[\033[01;34m\]\w\[\033[00m\]\$ '
EOF

# .bash_history erstellen
touch ros2_dev/.bash_history

echo "Verzeichnisstruktur erstellt:"
echo "  ros2_dev/"
echo "  ├── .bashrc"
echo "  ├── .bash_history"
echo "  └── workspace/"
echo ""
echo "Baue beim ersten Mal oder bei Änderungen den custom ros2 Container nach den Vorgaben im Dockerfile:"
echo "  docker compose build"
echo ""
echo "Danach können die Container wie folgt ausgeführt werden."
echo ""
echo "Docker-Anweisungen: ('cat cheatsheet' zum Anzeigen der Liste im Terminal)"
echo "  docker compose up -d ros2               führt den ros2 Container im Hintergrund aus"
echo "  docker exec -it ros2 bash               öffnet bash vom ros2 Container, 'exit' um zu beenden"
echo "  docker compose up micro-ros-agent       führt micro-ros-agent Container im gleichen Terminal aus"
echo "  docker compose up -d rplidar            führt rplidar Container im Hintergrund aus"
echo "  docker compose down                     stoppt und entfernt die aktuell laufenden Container"
echo "  docker compose ps                       zeigt Status der Container an"
echo ""
