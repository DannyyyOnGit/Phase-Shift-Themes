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

__author__ = "weirdpeople"
__date__ = "$May 20, 2011 03:14:00 AM$"

import Song as Song
from Theme import _

from OpenGL.raw.GL import glColor3f
from OpenGL.raw.GL import glColor4f
import string


class CustomSetlist:
  def __init__( self, theme ):
    self.theme = theme
    self.setlist_type = 3
    self.setlistStyle = 0
    self.headerSkip = 1
    self.footerSkip = 1
    self.labelType = 0
    self.labelDistance = 1
    self.showMoreLabels = False
    self.texturedLabels = False
    self.itemsPerPage = 12
    self.showLockedSongs = True
    self.showSortTiers = True
    self.selectTiers = False
    self.itemSize = ( 0, .07 )

    self.career_title_color = (1,1,1)
    self.song_name_text_color = (0.75,0.75,0.75)
    self.song_name_selected_color = (0.85,0.85,0.85)
    self.song_sort_color = (.6,.6,.6)
    self.artist_text_color = (0.75,0.75,0.75)
    self.artist_selected_color = (0.85,0.85,0.85)
    self.library_selected_color = (1,1,1)

  def run( self, ticks ):
    pass

  def renderHeader( self, scene ):
    #Weirdpeople - using this to render the rest of the list image behind the setlist
    ( w, h ) = scene.geometry

    scene.drawImage(scene.img_2ndlayer, scale = (1.0, -1.0), coord = (w/2,h/2), stretched = 3)
    scene.drawImage(scene.img_3rdlayer, scale = (1.0, -1.0), coord = (w/2,h/2), stretched = 3)
    scene.drawImage(scene.img_4thlayer, scale = (1.0, -1.0), coord = (w/2,h/2), stretched = 3)
    

  def renderUnselectedItem(self, scene, i, n):
    ( w, h ) = scene.geometry
    font = scene.fontDict['songListFont']
    font = scene.fontDict['songListFont']
    if not scene.items or scene.itemIcons is None:
      return
    item = scene.items[i]

    if scene.img_tier:
      imgwidth = scene.img_tier.width1()
      imgheight = scene.img_tier.height1()
      wfactor = 1160.0/imgwidth
      hfactor = 60.00/imgheight
      if isinstance(item, Song.TitleInfo) or isinstance(item, Song.SortTitleInfo):
        scene.drawImage(scene.img_tier, scale = (wfactor,-hfactor), coord = (w/2.8762, ((-n*.0565)*h )+ h/1.235), stretched = 11)

    icon = None
    if isinstance( item, Song.LibraryInfo ):
      try:
        icon = scene.itemIcons['Library']
        wfactor = 0.02
        scene.drawImage( icon, scale = ( wfactor, -wfactor ), coord = ( w / 1.025, h - 0.055 * h * ( n + 1 ) - 0.2 * h ), stretched = 11 )
      except KeyError:
        pass
    elif isinstance( item, Song.RandomSongInfo ):
      try:
        icon = scene.itemIcons['Random']
        wfactor = 0.02
        scene.drawImage( icon, scale = ( wfactor, -wfactor ), coord = ( w / 1.025, h - 0.055 * h * ( n + 1 ) - 0.2 * h ), stretched = 11 )
      except KeyError:
        pass

    if isinstance( item, Song.SongInfo ) or isinstance( item, Song.LibraryInfo ):
      ( c1, c2, c3 ) = self.song_name_text_color
      glColor4f( c1, c2, c3, 1 )
    elif isinstance( item, Song.TitleInfo ) or isinstance( item, Song.SortTitleInfo ):
      ( c1, c2, c3 ) = self.career_title_color
      glColor4f( c1, c2, c3, 1 )
    elif isinstance( item, Song.RandomSongInfo ):
      ( c1, c2, c3 ) = self.song_name_text_color
      glColor4f( c1, c2, c3, 1 )

    text = item.name

    if isinstance( item, Song.SongInfo ) and item.getLocked():
      text = _( '-- Locked --' )

    maxwidth = .43

    scale = 0.0016
    ( wt, ht ) = font.getStringSize( text, scale = scale )

    while wt > maxwidth:
      tlength = len( text ) - 2
      text = text[:tlength] + '...'
      ( wt, ht ) = font.getStringSize( text, scale = scale )
      if wt < maxwidth:
        break

    font.render( text, ( .07, .043 * ( n + 1 ) + .098 ), scale = scale )

    if isinstance( item, Song.SongInfo ):
      score = _( "Nil" )
      stars = 0
      name = ""
      if not item.getLocked():
        try:
          difficulties = item.partDifficulties[scene.scorePart.id]
        except KeyError:
          difficulties = []
        for d in difficulties:
          if d.id == scene.scoreDifficulty.id:
            scores = item.getHighscores( d, part = scene.scorePart )
            if scores:
              ( score, stars, name, scoreExt ) = scores[0]
              try:
               ( 
                  notesHit,
                  notesTotal,
                  noteStreak,
                  modVersion,
                  handicap,
                  handicapLong,
                  originalScore,
                  ) = scoreExt
              except ValueError:
                ( 
                  notesHit,
                  notesTotal,
                  noteStreak,
                  modVersion,
                  oldScores1,
                  oldScores2,
                  ) = scoreExt

              break
            else:
              ( score, stars, name ) = ( 0, 0, '---' )

        if score == _( 'Nil' ) and scene.nilShowNextScore:
          for d in difficulties:
            scores = item.getHighscores( d, part = scene.scorePart )
            if scores:
              ( score, stars, name, scoreExt ) = scores[0]
              try:
                ( 
                  notesHit,
                  notesTotal,
                  noteStreak,
                  modVersion,
                  handicap,
                  handicapLong,
                  originalScore,
                  ) = scoreExt
              except ValueError:
                ( 
                  notesHit,
                  notesTotal,
                  noteStreak,
                  modVersion,
                  oldScores1,
                  oldScores2,
                  ) = scoreExt

              break
            else:
              ( score, stars, name ) = ( 0, 0, '---' )
          else:
            ( score, stars, name ) = ( _( 'Nil' ), 0, '---' )

        scale = 0.0010
        if score != _( 'Nil' ) and score > 0 \
          and notesTotal != 0:
          text = '%.1f%%' % (float( notesHit ) / notesTotal * 100.0)
          font.render( text, ( 0.56, .043 * ( n + 1 ) + .098 ), scale = scale, align = 2 )

        if scene.img_starwhite and scene.img_stargold:
          imgwidth = scene.img_starwhite.width1()
          wfactor1 = 2.0 / imgwidth

          if stars == 6:
            for k in range( 0, 5 ):
              scene.drawImage( scene.img_stargold, scale = ( wfactor1 * 1.2, -wfactor1 * 1.2), coord = ( ( .58 + .025 * k ) * w, ((-n*.0565)*h )+ h/1.235), stretched = 11 )
          else:
            for k in range( 0, stars ):
              scene.drawImage( scene.img_starwhite, scale = ( wfactor1 * 1.2, -wfactor1 * 1.2), coord = ( ( .58 + .025 * k ) * w, ((-n*.0565)*h )+ h/1.235), stretched = 11 )

  def renderSelectedItem( self, scene, n ):
    ( w, h ) = scene.geometry
    font = scene.fontDict['songListFont']

    item = scene.selectedItem
    if not item:
      return
    if isinstance( item, Song.BlankSpaceInfo ):
      return

    if scene.img_tier:
      imgwidth = scene.img_tier.width1()
      imgheight = scene.img_tier.height1()
      wfactor = 1160.0/imgwidth
      hfactor = 60.00/imgheight
      if isinstance(item, Song.TitleInfo) or isinstance(item, Song.SortTitleInfo):
        scene.drawImage(scene.img_tier, scale = (wfactor,-hfactor), coord = (w/2.8762, ((-n*.0565)*h )+ h/1.235), stretched = 11)
      
    if scene.img_selected:
      imgwidth = scene.img_selected.width1()
      imgheight = scene.img_selected.height1()
      wfactor = 1160.0/imgwidth
      hfactor = 60.00/imgheight

      scene.drawImage(scene.img_selected, scale = (wfactor,-hfactor), coord = (w/2.8762, ((-n*.0565)*h )+ h/1.235), stretched = 11)
    icon = None
    if isinstance( item, Song.SongInfo ) and scene.practiceMode:
      ( c1, c2, c3 ) = self.song_name_selected_color
      glColor3f( c1, c2, c3 )
      text = _( 'Practice' )
    elif isinstance( item, Song.LibraryInfo ):
      ( c1, c2, c3 ) = self.library_selected_color
      glColor3f( c1, c2, c3 )
      if item.songCount == 1:
        text = _( 'There Is 1 Song In This Setlist.' )
      elif item.songCount > 1:
        text = _( 'There Are %d Songs In This Setlist.' ) % item.songCount
      else:
        text = ''
    else:
      text = ''

    font.render( text, ( 0.05, .155 ), scale = 0.0015, align = 2 )

    if isinstance( item, Song.SongInfo ) or isinstance( item, Song.LibraryInfo ) or isinstance( item, Song.RandomSongInfo ):
      ( c1, c2, c3 ) = self.song_name_selected_color
      glColor4f( c1, c2, c3, 1 )
    if isinstance( item, Song.TitleInfo ) or isinstance( item, Song.SortTitleInfo ):
      ( c1, c2, c3 ) = self.career_title_color
      glColor4f( c1, c2, c3, 1 )

    text = item.name

    maxwidth = .43

    scale = 0.0016
    ( wt, ht ) = font.getStringSize( text, scale = scale )

    while wt > maxwidth:
      tlength = len( text ) - 2
      text = text[:tlength] + '...'
      ( wt, ht ) = font.getStringSize( text, scale = scale )
      if wt < maxwidth:
        break

    font.render( text, ( .07, .043 * ( n + 1 ) + .098 ), scale = scale )

    if isinstance( item, Song.SongInfo ):
      score = _( "Nil" )
      stars = 0
      name = ""
      if not item.getLocked():
        try:
          difficulties = item.partDifficulties[scene.scorePart.id]
        except KeyError:
          difficulties = []
        for d in difficulties:
          if d.id == scene.scoreDifficulty.id:
            scores = item.getHighscores( d, part = scene.scorePart )
            if scores:
              ( score, stars, name, scoreExt ) = scores[0]
              try:
                ( 
                  notesHit,
                  notesTotal,
                  noteStreak,
                  modVersion,
                  handicap,
                  handicapLong,
                  originalScore,
                  ) = scoreExt
              except ValueError:
                ( 
                  notesHit,
                  notesTotal,
                  noteStreak,
                  modVersion,
                  oldScores1,
                  oldScores2,
                  ) = scoreExt

              break
            else:
              ( score, stars, name ) = ( 0, 0, '---' )

        if score == _( 'Nil' ) and scene.nilShowNextScore:
          for d in difficulties:
            scores = item.getHighscores( d, part = scene.scorePart )
            if scores:
              ( score, stars, name, scoreExt ) = scores[0]
              try:
                ( 
                  notesHit,
                  notesTotal,
                  noteStreak,
                  modVersion,
                  handicap,
                  handicapLong,
                  originalScore,
                  ) = scoreExt
              except ValueError:
                ( 
                  notesHit,
                  notesTotal,
                  noteStreak,
                  modVersion,
                  oldScores1,
                  oldScores2,
                  ) = scoreExt
              break
            else:
              ( score, stars, name ) = ( 0, 0, '---' )
          else:
            ( score, stars, name ) = ( _( 'Nil' ), 0, '---' )

        scale = 0.0010
        if score != _( 'Nil' ) and score > 0 and notesTotal != 0:
          text = '%.1f%%' % ( float( notesHit ) / notesTotal * 100.0)
          ( w, h ) = font.getStringSize( text, scale = scale )
          font.render( text, ( 0.56, .043 * ( n + 1 ) + .098 ), scale = scale, align = 2 )


        if scene.img_starwhite and scene.img_stargold:
          ( w, h ) = scene.geometry
          imgwidth = scene.img_starwhite.width1()
          wfactor1 = 2.0 / imgwidth

          if stars == 6:
            for k in range( 0, 5 ):
              scene.drawImage( scene.img_stargold, scale = ( wfactor1 * 1.2, -wfactor1 * 1.2), coord = ( ( .58 + .025 * k ) * w, ((-n*.0565)*h )+ h/1.235), stretched = 11 )
          else:
            for k in range( 0, stars ):
              scene.drawImage( scene.img_starwhite, scale = ( wfactor1 * 1.2, -wfactor1 * 1.2), coord = ( ( .58 + .025 * k ) * w, ((-n*.0565)*h )+ h/1.235), stretched = 11 )


  def renderItem(self, scene, color, label):
    if not scene.itemMesh:
      return

  def renderLibrary(self, scene, color, label):
    if not scene.libraryMesh:
      return

  def renderTitle(self, scene, color, label):
    if not scene.tierMesh:
      return

  def renderRandom(self, scene, color, label):
    if not scene.itemMesh:
      return

  def renderAlbumArt(self, scene):
    if not scene.itemLabels:
      return
    ( w, h ) = scene.geometry
    item = scene.items[scene.selectedIndex]
    i = scene.selectedIndex
    img = None
    lockImg = None
    if scene.itemLabels[i] == 'Random':
      if scene.img_random_label:
        img = scene.img_random_label
        imgwidth = img.width1()
        wfactor = 60.000 / imgwidth
      elif scene.img_empty_label:
        img = scene.img_empty_label
        imgwidth = img.width1()
        wfactor = 60.000 / imgwidth
    elif not scene.itemLabels[i]:
      if scene.img_empty_label != None:
        imgwidth = scene.img_empty_label.width1()
        wfactor = 60.000 / imgwidth
        img = scene.img_empty_label
    elif scene.itemLabels[i]:
      img = scene.itemLabels[i]
      wfactor = img.widthf( pixelw = 10.000 )
    if isinstance( item, Song.SongInfo ) and item.getLocked():
      if scene.img_locked_label:
        imgwidth = scene.img_locked_label.width1()
        wfactor2 = 60.000 / imgwidth
        lockImg = scene.img_locked_label
      elif scene.img_empty_label:
        imgwidth = scene.img_empty_label.width1()
        wfactor = 60.000 / imgwidth
        img = scene.img_empty_label
    if img:
      scene.drawImage( img, scale = ( 0.43, -0.43 ), coord = ( .826 * w, .7425 * h ), stretched = 12 )
    if lockImg:
      scene.drawImage( lockImg, scale = ( wfactor2, -wfactor2 ), coord = ( .826 * w, .7425 * h ), stretched = 12 )

  def renderForeground( self, scene ):
    font = scene.fontDict['songListFont']
    ( w, h ) = scene.geometry
    font = scene.fontDict['songListFont']

    ( c1, c2, c3 ) = self.song_sort_color
    glColor3f( c1, c2, c3 )

    text = _( 'SORTED BY' ) + ' '
    if scene.sortOrder == 0:
      text = text + ( 'SONG NAME' )
    elif scene.sortOrder == 1:
      text = text + ( 'ARTIST' )
    elif scene.sortOrder == 2:
      text = text + ( 'PLAY COUNT' )
    elif scene.sortOrder == 3:
      text = text + ( 'ALBUM NAME' )
    elif scene.sortOrder == 4:
      text = text + ( 'GENRE' )
    elif scene.sortOrder == 5:
      text = text + ( 'YEAR' )
    elif scene.sortOrder == 6:
      text = text + ( 'BAND DIFFICULTY' )
    elif scene.sortOrder == 7:
      text = text + ( 'INSTRUMENT DIFFICULTY' )
    else:
      text = text + ( 'SONG COLLECTION' )

    font.render( text, ( .18, .106 ), scale = 0.0015 )


    scene.drawImage(scene.img_6thlayer, scale = (1.0, -1.0), coord = (w/2,h/2), stretched = 3)

    if scene.searching:
      font.render( scene.searchText, ( .5, .7 ), align = 1 )

  def renderSelectedInfo( self, scene ):
    ( w, h ) = scene.geometry
    font = scene.fontDict['songListFont']
    item = scene.selectedItem

    #weirdpeople - This renders stuff about only the currently selected song
    if isinstance( item, Song.SongInfo ):

      #albumtag = item.album
      #( wt, ht ) = font.getStringSize( albumtag, scale = scale )

      #while wt > .22:
      #  tlength = len( albumtag ) - 4
      #  albumtag = albumtag[:tlength] + '...'
      #  ( wt, ht ) = font.getStringSize( albumtag, scale = scale )
      #  if wt < .08:
      #    break

      #font.render( albumtag, ( .08, .35 ), scale = 0.00150001 )

      #genretag = item.genre
      #font.render( genretag, ( .08, .37 ), scale = 0.00150001 )

      #yeartag = item.year
      #font.render( yeartag, ( .08, .39 ), scale = 0.00150001 )

      imgwidth = scene.img_guitar.width1()
      wfactor1 = 15.5 / imgwidth

      scene.drawImage( scene.img_band, scale = ( wfactor1, -wfactor1), coord = (.725 * w, .465 * h ), stretched = 11 )

      scene.drawImage( scene.img_guitar, scale = ( wfactor1, -wfactor1), coord = (.725 * w, .41 * h ), stretched = 11 )
      scene.drawImage( scene.img_proguitar, scale = ( wfactor1, -wfactor1), coord = (.845 * w, .41 * h ), stretched = 11 )

      scene.drawImage( scene.img_bass, scale = ( wfactor1, -wfactor1), coord = (.725 * w, .355 * h ), stretched = 11 )
      scene.drawImage( scene.img_probass, scale = ( wfactor1, -wfactor1), coord = (.845 * w, .355 * h ), stretched = 11 )

      scene.drawImage( scene.img_drum, scale = ( wfactor1, -wfactor1), coord = (.725 * w, .30 * h ), stretched = 11 )
      scene.drawImage( scene.img_prodrum, scale = ( wfactor1, -wfactor1), coord = (.845 * w, .30 * h ), stretched = 11 )

      scene.drawImage( scene.img_keys, scale = ( wfactor1, -wfactor1), coord = (.725 * w, .245 * h ), stretched = 11 )
      scene.drawImage( scene.img_prokeys, scale = ( wfactor1, -wfactor1), coord = (.845 * w, .245 * h ), stretched = 11 )

      scene.drawImage( scene.img_vocal, scale = ( wfactor1, -wfactor1), coord = (.725 * w, .19 * h ), stretched = 11 )
      scene.drawImage( scene.img_vocalharm3, scale = ( wfactor1, -wfactor1), coord = (.845 * w, .19 * h ), stretched = 11 )

      if scene.img_diff3 != None:
        imgwidth = scene.img_diff3.width1()

        wfactor1 = .9 / imgwidth

      for i in range( 6 ):
        glColor3f( 1, 1, 1 )
        if i == 0:
          diff = item.diffSong
        elif i == 1:
          diff = item.diffGuitar
        elif i == 2:
          diff = item.diffDrums
        elif i == 3:
          diff = item.diffBass
        elif i == 4:
          diff = -2
        elif i == 5:
          diff = item.diffVocals
        if diff == -1:
          font.render( 'NO PART', ( .75, .4035 + i * 0.0415 ), scale = 0.00125 )
        elif diff == -2:
          font.render( 'N/A', ( .75, .4035 + i * 0.0415 ), scale = 0.00125 )#that specific instrument isn't implemented in fofix
        elif diff == 6:
          for k in range( 0, 5 ):
            scene.drawImage( scene.img_diff3, scale = ( wfactor1, -wfactor1), coord = ( ( .75 + .016 * k ) * w, ( 0.466 - 0.055 * i ) * h ), stretched = 11 )
        else:
          for k in range( 0, 5):
            scene.drawImage( scene.img_diff1, scale = ( wfactor1, -wfactor1), coord = ( ( .75 + .016 * k ) * w, ( 0.466 - 0.055 * i ) * h ), stretched = 11 )
          for k in range( 0, diff ):
            scene.drawImage( scene.img_diff2, scale = ( wfactor1, -wfactor1), coord = ( ( .75 + .016 * k ) * w, ( 0.466 - 0.055 * i ) * h ), stretched = 11 )

      for i in range( 5 ):#for when pro  instruments start toet implemented
        glColor3f( 1, 1, 1 )

        if i == 0:#pro guitar
          diff = -2

        elif i == 1:#pro drums
          diff = -2

        elif i == 2:#pro bass
          diff = -2

        elif i == 3:#pro keys
          diff = -2

        elif i == 4:#vocal harmonies
          diff = -2


        if diff == -1:
          font.render( 'NO PART', ( .87, .445 + i * .0415 ), scale = 0.00125 )

        elif diff == -2:
          font.render( 'N/A', ( .87, .445 + i * .0415 ), scale = 0.00125 )#that specific instrument isn't implemented in fofix

        elif diff == 6:
          for k in range( 0, 5 ):
            scene.drawImage( scene.img_diff3, scale = ( wfactor1, -wfactor1), coord = ( ( .86 + .016 * k ) * w, ( 0.466 - 0.055 * i ) * h ), stretched = 11 )

        else:
          for k in range( 0, 5):
            scene.drawImage( scene.img_diff1, scale = ( wfactor1, -wfactor1), coord = ( ( .87 + .016 * k ) * w, ( 0.466 - 0.055 * i ) * h ), stretched = 11 )
          for k in range( 0, diff ):
            scene.drawImage( scene.img_diff2, scale = ( wfactor1, -wfactor1), coord = ( ( .87 + .016 * k ) * w, ( 0.466 - 0.055 * i ) * h ), stretched = 11 )

  def renderMoreInfo( self, scene ):
    if not scene.items:
      return

    if not scene.selectedItem:
      return

    item = scene.selectedItem
    i = scene.selectedIndex
    y = 0
    ( w, h ) = scene.geometry
    font = scene.fontDict['songListFont']
    self.theme.fadeScreen( .25 )
    if scene.moreInfoTime < 500:
      y = 1.0 - float( scene.moreInfoTime ) / 500.0

    yI = y * h
    if scene.img_panel:
      scene.drawImage( scene.img_panel, scale = ( 1.0, -1.0 ), coord = ( w * .5, h * .5 + yI ), stretched = 0 )

    if scene.img_tabs:
      r0 = ( 0, 1.0 / 3.0, 0, .5 )
      r1 = ( 1.0 / 3.0, 2.0 / 3.0, 0, .5 )
      r2 = ( 2.0 / 3.0, 1.0, 0, .5 )
      if scene.infoPage == 0:
        r0 = ( 0, 1.0 / 3.0, .5, 1.0 )
        scene.drawImage( scene.img_tab1, scale = ( .5, -.5 ), coord = ( w * .5, h * .5 + yI ) )
        text = item.name
        if item.artist != '':
          text += ' by %s' % item.artist

        if item.year != '':
          text += ' (%s)' % item.year

        scale = font.scaleText( text, .08, 0.00160001 )
        font.render( text, ( .08, .25 - y ), scale = scale, align = 1 )
        if scene.itemLabels[i]:
          imgwidth = scene.itemLabels[i].width1()
          wfactor = 75.000 / imgwidth
          scene.drawImage( scene.itemLabels[i], ( wfactor, - wfactor ), ( w * .375, h * .5 + yI ), stretched = 11 )

        elif scene.img_empty_label:
          imgwidth = scene.img_empty_label.width1()
          wfactor = 75.000 / imgwidth
          scene.drawImage( scene.img_empty_label, ( wfactor, - wfactor ), ( w * .375, h * .5 + yI ), stretched = 11 )

        text = item.album
        if text == '':
          text = _( 'No Album' )

        scale = font.scaleText( text, 0.2, 0.0016 )
        font.render( text, ( .56, .305 - y ), scale = scale )
        text = item.genre
        if text == '':
          text = _( 'No Genre' )

        scale = font.scaleText( text, 0.2, 0.0016 )
        font.render( text, ( .56, .35 - y ), scale = scale )

      elif scene.infoPage == 1:
        r1 = ( 1.0 / 3.0, 2.0 / 3.0, .5, 1.0 )
        scene.drawImage( scene.img_tab2, scale = ( .5, -.5 ), coord = ( w * .5, h * .5 + yI ) )

      elif scene.infoPage == 2:
        r2 = ( 2.0 / 3.0, 1.0, .5, 1.0 )
        scene.drawImage( scene.img_tab3, scale = ( .5, -.5 ), coord = ( w * .5, h * .5 + yI ) )

      scene.drawImage( scene.img_tabs, scale = ( .5 * ( 1.0 / 3.0 ), - .25 ), coord = ( w * .36, h * .72 + yI ), rect = r0 )
      scene.drawImage( scene.img_tabs, scale = ( .5 * ( 1.0 / 3.0 ), - .25 ), coord = ( w * .51, h * .72 + yI ), rect = r1 )
      scene.drawImage( scene.img_tabs, scale = ( .5 * ( 1.0 / 3.0 ), - .25 ), coord = ( w * .66, h * .72 + yI ), rect = r2 )

  def renderMiniLobby( self, scene ):
    return
