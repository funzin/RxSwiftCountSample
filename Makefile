.PHONEY: install
install: install-carthage xcodegen

.PHONEY: install-carthage
install-carthage:
	carthage update --platform iOS

xcodegen:
	xcodegen generate
