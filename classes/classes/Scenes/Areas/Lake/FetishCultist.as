﻿package classes.Scenes.Areas.Lake
{
	import classes.Appearance;
	import classes.Monster;

	/**
	 * ...
	 * @author Fake-Name
	 */


	public class FetishCultist extends Monster
	{
		private function cultistRaisePlayerLust():void {
			//Two text variants!
			if(rand(2) == 0) {
				if(armorName == "pervy nun's clothing") outputText("She suddenly stops chanting and spreads her legs, opening her loose pussy wide with one hand while moaning like a whore.  She toys with her breasts and fondles one of her nipples with her other hand.\n\nDespite yourself,  you can't help but be aroused by the scene.", false);
				if(armorName == "noble's clothing") outputText("She suddenly blushes and start giggling, saying: 'Really my lord!' in a suave, submitting voice while pulling down her skirt.  The movement lets you get an even better look down her cleavage, and her breasts appear even fuller than before.\n\nDespite yourself, you can't help but be aroused by the scene.", false);
				if(armorName == "swimsuit") outputText("She does a series of lewd stretches, showing off her tightly-clad, sexy body in every possible detail.  In particular, her excited, blood-gorged pussy lips, clearly outlined, seem to be begging for you to come and grope them.  For a start.  Despite yourself, you can't help but be aroused by the scene.", false);
				if(armorName == "teacher's outfit") outputText("Obviously very flexible, she arches her back with one hand on her hip, displaying her firm round ass while looking at you with a lascivious expression.  She says in a sexy voice, \"<i>Maybe we should have a... private talk after class...</i>\"  Despite yourself, you can't help but be aroused by the scene.", false);
				if(armorName == "naughty nurse's uniform") outputText("Still displaying her figure in her tight suit, she asks with a lewd smile, \"<i>Is there one of your needs I could satisfy, my dear?</i>\"  She grabs one of her firm, full breasts, \"<i>Are you thirsty, maybe?</i>\"  Despite yourself, you can't help but be aroused by the scene.", false);
				if(armorName == "fetishy outfit") outputText("She suddenly starts posing in sexy outfits.  Despite yourself, you can't help but be aroused by it.", false);
			}
			else {
				outputText("She suddenly starts mauling her shapely breasts, her fingers nearly disappearing briefly in the soft, full flesh, while fingering herself eagerly, emitting a variety of lewd noises.  You are entranced by the scene, the sexual excitement she's experiencing penetrating your body in warm waves coming from your groin.", false);
			}
			game.dynStats("lus", (player.lib/10 + player.cor/20)+4);
			if(player.lust >= 100) doNext(game.endLustLoss);
			else doNext(5000);
		}
		private function cultistLustTransfer():void {
			if(lust <= 30 || rand(2) == 0) {
				outputText("Her eyes glaze over, ", false);
				if(player.cor < 40) outputText("and you're almost afraid to know ", false);
				else outputText("and you wish you knew ", false);
				outputText("what she is thinking of since you can almost feel her own lust building.", false);
				lust += 10;
			}
			else {
				outputText("Her eyes glaze over and you feel your mind suddenly becoming filled with a blur of every sexual perversion you could possibly think of, and then some.", false);
				if(player.vaginas.length > 0) {
					outputText("  You feel your " + vaginaDescript(0) + " soaking itself in a sudden burst", false);
					if(player.cockTotal() > 0)  outputText(", while a sudden influx of pre-cum blurts out and streams down your " + multiCockDescriptLight() + ", painfully hardened by a vast amount of blood rushing to your groin", false);
					outputText(".", false);
				}
				else if(player.cockTotal() > 0) outputText("  A sudden influx of pre-cum blurts out and stream down your " + multiCockDescriptLight() + ", painfully hardened by a vast amount of blood rushing to your groin.", false);
				if(player.gender == 0) outputText("  Your genderless body is suddenly filled by a perverted warmth.", false);
				outputText("\n\nYou notice that the young woman seems to have calmed down some.", false);
				game.dynStats("lus", (lust/3 * (1 + player.cor/300)));
				lust -= 50;
				if(lust < 0) lust = 10;
			}
			if(player.lust >= 100) doNext(game.endLustLoss);
			else doNext(5000);
		}
		

		override public function defeated(hpVictory:Boolean):void
		{
			var temp2:Function =null;
			if(player.hasStatusAffect("Feeder") >= 0) temp2 = game.fetishCultistScene.fetishCultistHasAMilkFetish;
			if (hpVictory) {
				outputText("Hurt too much to continue controlling her powers, the cultist collapses helplessly.", true);
			} else {
				outputText("Overwhelmed by her lusts, the cultist loses the ability to control herself and collapses.", true);
			}
			if(player.lust >= 33 && player.gender > 0) {
				outputText("  You realize she'd make a perfect receptacle for your lusts.  Do you have your way with her?", false);
				game.simpleChoices("Sex",game.fetishCultistScene.playerRapesCultist,"",0,"",0,"B. Feed",temp2,"Leave",game.cleanupAfterCombat);
			}
			else {
				if(temp2!=null) {
					outputText("  She looks like she might take some of your milk if you offered it to her.  What do you do?", false);
					game.simpleChoices("B. Feed",temp2,"",0,"",0,"",0,"Leave",game.cleanupAfterCombat);
				}
				else game.cleanupAfterCombat();
			}
		}

		override public function won(hpVictory:Boolean, pcCameWorms:Boolean):void
		{
			if (hpVictory){
				super.won(hpVictory,pcCameWorms);
			} else {
				if (pcCameWorms){
					outputText("\n\nThe cultist giggles as she watches you struggling.\n\n", false);
				}
				game.fetishCultistScene.cultistRapesYou();
			}
		}

		override protected function performCombatAction():void
		{
			game.eventParser(Appearance.randomChoice(special1, special2));
		}

		public function FetishCultist()
		{
			trace("FetishCultist Constructor!");
			init01Names("the ", "fetish cultist", "fetishcultist", "The woman across from you has her eyes closed, her hands joined, and seems to be chanting under her breath. She is wearing a religious outfit that closely hugs her curvacious shape, with a skirt so short that you can clearly see her pussy's lips.\n\nShe has clealy lost her grasp on sanity, and filled the void with pure perversion.");
			init02Female(VAGINA_LOOSENESS_GAPING, VAGINA_WETNESS_WET);
			init03BreastRows("DD");
			init04Ass(ANAL_LOOSENESS_NORMAL,ANAL_WETNESS_NORMAL);
			init05Body("5'7",HIP_RATING_AMPLE,BUTT_RATING_LARGE);
			init06Skin("pale");
			init07Hair("black",15);
			init08Face();
			init09PrimaryStats(35,25,30,1,75,80,90);
			init10Weapon("whip","whip-crack");
			init11Armor("fetishy outfit");
			init12Combat(0,25,1,Monster.TEMPERMENT_LOVE_GRAPPLES);
			init13Level(2,5+rand(10));
			initX_Specials(cultistRaisePlayerLust,cultistLustTransfer,cultistRaisePlayerLust);
		}

	}

}