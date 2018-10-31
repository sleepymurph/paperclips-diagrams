.PHONY: all pdfs pngs

all: pdfs pngs

pdfs: $(addsuffix .pdf, $(basename $(wildcard *.tex *.dot)))
pngs: $(addsuffix .png, $(basename $(wildcard *.tex *.dot)))

%.pdf: %.tex
	pdflatex $^

%.pdf: %.dot
	dot $^ -Tpdf -o $@

# CONVERSION FROM PDF CURRENTLY BROKEN on default Ubuntu configuration
# (as of October 2018, but there is a workaround)
#
# You will get "not authorized" errors. This is because:
#
# - This build uses ImageMagick to convert PDF to PNG (because afaik
#   you can't generate PNGs directly from LaTeX/tikz)
#
# - ImageMagick has a configurable security policy. The default policy is set by
#   your Linux distribution distribution in /etc/ImageMagick-6/policy.xml
#
# - Ubuntu has started including a default ImageMagick policy that
#   diasables PDFs by default. This is because of a code-execution
#   vulnerability in Ghostscript, and because the biggest use for
#   ImageMagick is image manipulation in web servers. Bad combo.
#
# - You can re-enable PDFs by deleting or commenting out the following
#   lines from the policy file: /etc/ImageMagick-6/policy.xml
#
#         <!-- disable ghostscript format types -->
#         <policy domain="coder" rights="none" pattern="PS" />
#         <policy domain="coder" rights="none" pattern="EPI" />
#         <policy domain="coder" rights="none" pattern="PDF" />
#         <policy domain="coder" rights="none" pattern="XPS" />
#
# - It is possible to create a user policy.xml in ~/.magick/policy.xml .
#   However, the root settings override your user settings. So you
#   cannot re-enable things for just yourself. You have to edit the
#   root policy.xml file.
#
# More info:
#
# - Imagemagick info on policy file:
#   <https://imagemagick.org/script/security-policy.php>
#
# - Ubuntu changelog for imagemagick:
#   <https://launchpad.net/ubuntu/+source/imagemagick/+changelog>
#
# - Debian patch file that disables PDFs in policy.xml during build:
#   <https://git.launchpad.net/ubuntu/+source/imagemagick/tree/debian/patches/200-disable-ghostscript-formats.patch?h=ubuntu/bionic-updates>
#
# - Commit that adds the patch file to Ubuntu:
#   <https://git.launchpad.net/ubuntu/+source/imagemagick/commit/?h=ubuntu/bionic-updates&id=b073c8ff5fa055eddc5d608d4b330f7ec36dbc94>
#
%.png: %.pdf
	# Conversion from PDF may be disabled by your distro.
	# If you receive "not authorized" errors, see the longer comment in the Makefile.
	convert -density 125 -alpha remove $^ $@
