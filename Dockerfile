FROM greyltc/archlinux-aur:yay

RUN pacman -Sy --noconfirm p7zip mame-tools git
RUN sudo -u ab -D~ bash -c 'yay -Syu --removemake --needed --noprogressbar --noconfirm tochd'

CMD tochd -d /out $TOCHD_ARGS -E -- /in
