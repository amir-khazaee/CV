# ============================================================================= #
# Version  v1.1.0                                                               #
# Date     2023.06.08                                                           #
# CoachCrew.tech                                                                #
# admin@CoachCrew.tech                                                          #
# ============================================================================= #

# Set base image -------------------------------------------------------------- #
FROM texlive/texlive:latest-minimal

# Set working directory ------------------------------------------------------- #
WORKDIR /usr/src


# Install LaTeX packages -------------------------------------------------------- #
RUN tlmgr install                                                                \
      latex-bin collection-latexrecommended                                      \
      titlesec enumitem subfiles lastpage fancyhdr outline import                \
 && tlmgr path add
