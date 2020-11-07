

BIN=./server
BIN_PORT=8080

## Test files

DATA=./data

#Large 
# https://github.com/cachapa/AerialDream/blob/master/app/fetch_playlists.sh
LARGE_MANIFEST_01=http://a1.phobos.apple.com/us/r1000/000/Features/atv/AutumnResources/videos/entries.json
LARGE_MANIFEST_02=https://sylvan.apple.com/Aerials/2x/entries.json

#Small
# https://developer.apple.com/streaming/examples/
SMALL_01=https://devstreaming-cdn.apple.com/videos/streaming/examples/img_bipbop_adv_example_ts/master.m3u8
SMALL_02=https://devstreaming-cdn.apple.com/videos/streaming/examples/img_bipbop_adv_example_fmp4/master.m3u8
SMALL_03=https://devstreaming-cdn.apple.com/videos/streaming/examples/bipbop_adv_example_hevc/master.m3u8

# Audio
AUDIO_SRC=http://www.hubharp.com/web_sound/BachGavotteShort.mp3

print:
	@echo
	@echo BIN: $(BIN)
	@echo BIN_PORT: $(BIN_PORT)
	@echo

	@echo LARGE_MANIFEST_01: $(LARGE_MANIFEST_01)
	@echo LARGE_MANIFEST_02: $(LARGE_MANIFEST_02)
	@echo SMALL_SRC: $(SMALL_SRC)
	@echo AUDIO_SRC: $(AUDIO_SRC)
	@echo

dep:
	brew cask install ngrok

	brew install ffmpeg
	
	# fast golang downloader. Uses range.., just like hls itself
	go get github.com/Code-Hex/pget/cmd/pget

	# m3u8 downloader. does not do joins
	go get github.com/oopsguy/m3u8

LIB=github.com/Greyh4t/m3u8-Downloader-Go
LIB_FSPATH=$(GOPATH)/src/$(LIB)

dep1:
	#git clone https://$(LIB) $(LIB_FSPATH)
	cd $(LIB_FSPATH) && go build -o m3u8 .
	cp $(LIB_FSPATH)/m3u8 $(PWD)/m3u8


build:
	go build -o $(BIN) .


serve:
	$(BIN)
	# open http://localhost:8080/
serve-public:
	ngrok http $(BIN_PORT)
	# open https://b89725841d38.ngrok.io

### Data

data-delete:
	rm -rf $(DATA)
data-big:
	mkdir -p $(DATA)/large
	cd $(DATA)/large && pget $(LARGE_MANIFEST_01) --output manifest01.json
	cd $(DATA)/large && pget $(LARGE_MANIFEST_02) --output manifest02.json
	# inside
	cd $(DATA)/large && pget -p 6 https://sylvan.apple.com/Aerials/2x/Videos/LA_A006_C008_2K_SDR_HEVC.mov
	
data-small:
	mkdir -p $(DATA)/small
	# get M3U8
	#cd $(DATA)/small && pget $(SMALL_01)

	# get all videos
	#cd $(DATA)/small && m3u8 -u $(SMALL_01) -o .

	# get all videos
	./m3u8 -u $(SMALL_01) -o $(DATA)/small/01
data-audio:
	mkdir -p $(DATA)/audio
	cd $(DATA)/audio && pget $(AUDIO_SRC)

### Trancode
trans-run:
	cd $(DATA)/audio && ffmpeg -i BachGavotteShort.mp3 -c:a libmp3lame -b:a 128k -map 0:0 -f segment -segment_time 10 -segment_list outputlist.m3u8 -segment_format mpegts output%03d.ts