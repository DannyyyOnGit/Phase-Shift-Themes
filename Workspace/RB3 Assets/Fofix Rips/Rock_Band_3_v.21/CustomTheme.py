# -*- coding: utf-8 -*-
#####################################################################
#                                                                   #
# Frets on Fire X (FoFiX)                                           #
# Copyright (C) 2006 Sami Kyöstilä                                  #
#         2008 myfingershurt                                        #
#         2008 Blazingamer                                          #
#         2008 evilynux <evilynux@gmail.com>                        #
#         2010 FoFiX Team                                           #
#                                                                   #
# This program is free software; you can redistribute it and/or     #
# modify it under the terms of the GNU General Public License       #
# as published by the Free Software Foundation; either version 2    #
# of the License, or (at your option) any later version.            #
#                                                                   #
# This program is distributed in the hope that it will be useful,   #
# but WITHOUT ANY WARRANTY; without even the implied warranty of    #
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the     #
# GNU General Public License for more details.                      #
#                                                                   #
# You should have received a copy of the GNU General Public License #
# along with this program; if not, write to the Free Software       #
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,        #
# MA  02110-1301, USA.                                              #
#####################################################################

__author__ = "Weirdpeople"
__date__ = "$Nov 15, 2010 03:06:00 PM$"

from Theme import Theme


class CustomTheme( Theme ):

  def __init__( 
    self,
    path,
    name,
    iniFile = False,
    ):

    Theme.__init__( self, path, name )
 
    #main menu
    self.menuPos = [0.235,0.75]
    self.main_menu_vspacingVar = 0.065
    self.main_menu_scaleVar = 0.6
    self.use_solo_submenu = False
		
    #pov
    self.neckLength = 6.5
    self.neckWidth = 3.23
    self.povTarget = [ 0.0, 1.0, 2.35 ]
    self.povOrigin = [ 0.0, 3.4, -3.9 ]
    # self.povTargetX = 0.0 
    # self.povTargetY = 1 
    # self.povTargetZ = 2.35
    # self.povOriginX = 0.0
    # self.povOriginY = 3.4
    # self.povOriginZ = -3.9

    self.povIntroAnimation = "rockband"
		
    #3d fret settings
    # self.keyrot = [4.00, 2.00, 0.00, -2.00, -4.00]
    # self.keypos = [0.04, 0.01, 0.00, 0.01, 0.04]
    self.twoDkeys = True
    self.twoDnote = True

    self.noteTailSpeedMulti = 2.5

    #hitglows/hit images
    self.hitFlameBlackRemove = False
    self.hitFlameSize = .19
    self.holdFlameSize = .19
    self.hitFlamePos = (0, 1.15)
    self.holdFlamePos = (0, .4)
    self.HitFlameFrameLimit = 26
    self.hitFlameRotation = (180, 0, 1, 0)
    self.hitGlowsRotation = (180, 0, 1, 0)
    self.hitGlowOffset = (.095, .025, .02, .025, .095)
    self.hitFlameOffset = (.075, .05, .025, .05, .075)
		
    #loading
    self.loadingY = 20
    self.loadingX = 20
    self.loadingPhrase = ["hi"]

    self.fpsRenderPos = (0.15, .055)

    #setlist
    self.songListDisplay = 3
    self.songSelectSubmenuX = 0.5
    self.songSelectSubmenuY = 0.075

    self.setlist = self.loadThemeModule( 'CustomSetlist' )