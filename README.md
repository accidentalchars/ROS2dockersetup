# ROS2 Docker Setup

## Quick Start

1. Docker installieren: https://docs.docker.com/get-started/get-docker/

2. Repository klonen und das Verzeichnis im Terminal öffnen

3. Anpassen von `ROS_DOMAIN_ID` in `docker-compose.yaml` entsprechend der Einstellung des Edurob V2

4. Öffnen des geklonten Repository im Terminal und Ausführen der folgenden Befehle:

    ```bash
    ./setup_ros2_dev.sh                # ros2 Docker Verzeichnis- und Dateistruktur vorbereiten
    docker compose build               # baut den custom ros2 Container nach Dockerfile-Vorgaben
    docker compose up -d ros2          # führt den ros2 Container im Hintergrund aus
    docker exec -it ros2 bash          # öffnet bash vom ros2 Container, 'exit' um zu beenden
    ```
    Dadurch ist im Terminal die ros2 Containerumgebung aktiv, teste z. B. `echo $ROS_DOMAIN_ID` oder `echo $ROS_DISTRO`
   
5. Öffne ein neues Terminal für den micro-ros-agent Container:

   `docker compose up micro-ros-agent  # führt den micro-ros-agent Container im aktuellen Terminal aus`

   Drücke den reset-Taster am Edurob und es sollten entsprechend die Ausgaben vom micro-ros-agent erscheinen:

   ```bash
   [1761729504.052943] info     | UDPv4AgentLinux.cpp | init                     | running...             | port: 8888
   [1761729504.055070] info     | Root.cpp           | set_verbose_level        | logger setup           | verbose_level: 4
   [1761729843.354045] info     | Root.cpp           | create_client            | create                 | client_key: 0x7A4912AF, session_id: 0x81
   [1761729843.355923] info     | SessionManager.hpp | establish_session        | session established    | client_key: 0x7A4912AF, address: 10.0.109.1:47138
   [1761729843.510983] info     | ProxyClient.cpp    | create_participant       | participant created    | client_key: 0x7A4912AF, participant_id: 0x000(1)
   [1761729843.574304] info     | ProxyClient.cpp    | create_topic             | topic created          | client_key: 0x7A4912AF, topic_id: 0x000(2), participant_id: 0x000(1)
   [1761729843.586440] info     | ProxyClient.cpp    | create_subscriber        | subscriber created     | client_key: 0x7A4912AF, subscriber_id: 0x000(4), participant_id: 0x000(1)
   [1761729843.594849] info     | ProxyClient.cpp    | create_datareader        | datareader created     | client_key: 0x7A4912AF, datareader_id: 0x000(6), subscriber_id: 0x000(4)
   [1761729843.601925] info     | ProxyClient.cpp    | create_topic             | topic created          | client_key: 0x7A4912AF, topic_id: 0x001(2), participant_id: 0x000(1)
   [1761729843.607856] info     | ProxyClient.cpp    | create_publisher         | publisher created      | client_key: 0x7A4912AF, publisher_id: 0x000(3), participant_id: 0x000(1)
   [1761729843.614818] info     | ProxyClient.cpp    | create_datawriter        | datawriter created     | client_key: 0x7A4912AF, datawriter_id: 0x000(5), publisher_id: 0x000(3)
   ```bash

6. Zurück im Terminal mit der ros2-Containerumgebung kann nun z. B. mit `ros2 run teleop_twist_keyboard teleop_twist_keyboard` die Fernsteuerung des Edurob V2 getestet werden.

## Beispielhafte Befehle 

```bash
docker compose build               # baut den custom ros2 Container nach Dockerfile-Vorgaben
docker compose up -d ros2          # führt den ros2 Container im Hintergrund aus
docker exec -it ros2 bash          # öffnet bash vom ros2 Container, 'exit' um zu beenden
docker compose up micro-ros-agent  # führt den micro-ros-agent Container im aktuellen Terminal aus
docker compose up -d rplidar       # führt den rplidar Container im Hintergrund aus
docker compose down                # stoppt und entfernt die aktuell laufenden Container
docker compose ps                  # zeigt Status der laufenden Container an
```
Im Terminal kann die Liste mit `cat cheatsheet` angezeigt werden

## Projektstruktur

```
.
├── cheatsheet            # Datei mit Liste der beispielhaften Dockerbefehle
├── Dockerfile            # Dockerfile für ROS2 Image mit zusätzlich zu installierenden Paketen 
├── docker-compose.yaml   # yaml-Datei zur Konfiguration der Container
├── setup_ros2_dev.sh     # Skript um ROS2 Docker Verzeichnis- und Dateistruktur vorzubereiten
└── ros2_dev/             # Geteilter Ordner von Host und Container (geteilte Verzeichnisse in `docker-compose.yaml` unter `volumes:`)
    ├── .bashrc           # Bash-Konfiguration
    └── .bash_history     # Befehlshistorie
    └── workspace/        # Dein ROS2 Workspace
```
