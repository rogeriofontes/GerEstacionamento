package br.com.unipac.GerEstacionamento.liskoysubstitutionprincipe;

import java.util.ArrayList;
import java.util.List;

public class ClientTestProgram {

    public static void main(String[] args) {

        // Created list of video players
        List <VideoMediaPlayer> allPlayers = new ArrayList<>();
        allPlayers.add(new VlcMediaPlayer());
        allPlayers.add(new DivMediaPlayer());

        // Play video in all players
        playVideoInAllMediaPlayers(allPlayers);

        // Well - all works as of now...... :-)
        System.out.println("---------------------------");

        // Now adding new Winamp player. If you uncomment below line,
        // it would give compile time error as can't add audio player in list of video players.
        // allPlayers.add(new WinampMediaPlayer());
    }

    /**
     * This method is playing video in all players
     *
     * @param allPlayers
     */
    public static void playVideoInAllMediaPlayers(List<VideoMediaPlayer> allPlayers) {

        for (VideoMediaPlayer player: allPlayers) {
            player.playVideo();
        }
    }
}
