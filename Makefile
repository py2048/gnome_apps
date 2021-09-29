all: Ant Layan Tela Logiops bamboo

# Ant themes
Ant:
	cd ./Ant && git pull && ln -sf $(pwd) ~/.themes

# Layan kvantum themes
Layan:
	cd ./Layan-kde && git pull && ./install.sh

# Tela icons
Tela:
	cd ./Tela-icon-theme && git pull && ./install.sh

# logiops
Logiops:
	cd ./logiops && git pull && mkdir -p build && cd build && cmake .. && make && sudo make install

# ibus bamboo
bamboo:
	cd ./ibus-bamboo && git pull && sudo make install
	ibus restart
	env DCONF_PROFILE=ibus dconf write /desktop/ibus/general/preload-engines "['BambooUs', 'Bamboo']" && gsettings set org.gnome.desktop.input-sources sources "[('xkb', 'us'), ('ibus', 'Bamboo')]"
