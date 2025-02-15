FROM oven/bun AS build

WORKDIR /build
COPY input-builder .
ENV NODE_ENV=production
RUN bun build ./index.ts --compile --minify --outfile build-input

FROM greyltc/archlinux-aur:yay

RUN pacman -Sy --noconfirm p7zip mame-tools git
RUN sudo -u ab -D~ bash -c 'yay -Syu --removemake --needed --noprogressbar --noconfirm tochd'
COPY --from=build /build/build-input /bin/build-input

CMD cd /in && cat <(/bin/build-input) | tochd -d /out $TOCHD_ARGS -E -
