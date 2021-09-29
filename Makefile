all: update Ant Layan Tela logiops bamboo

update:
	git pull
	git submodule update --init --recursive
	
# Ant themes
Ant:
	cd ./Ant && ln -sf $(pwd) ~/.themes

# Layan kvantum themes
Layan:
	cd ./Layan-kde && ./install.sh

# Tela icons
Tela:
	cd ./Tela-icon-theme && ./install.sh

# logiops
Logiops:
	cd ./logiops && mkdir -p build && cd build && cmake .. && make && sudo make install

# ibus bamboo
bamboo:
	cd ./ibus-bamboo && sudo make install
	ibus restart
	env DCONF_PROFILE=ibus dconf write /desktop/ibus/general/preload-engines "['BambooUs', 'Bamboo']" && gsettings set org.gnome.desktop.input-sources sources "[('xkb', 'us'), ('ibus', 'Bamboo')]"

