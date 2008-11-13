//
//  ColoresAppDelegate.m
//  Colores
//
//  Created by luis on 19/09/08.
//  Copyright masshacking 2008. All rights reserved.
//

#import "ColoresAppDelegate.h"
#import "UIColor-MoreColors.h"

@implementation ColoresAppDelegate

@synthesize window;
@synthesize colorPicker;

- (void)applicationDidFinishLaunching:(UIApplication *)application {    

    // Override point for customization after application launch
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [colorPicker release];
    [window release];
    [super dealloc];
}

- (IBAction) changeColores:(id)sender {
  NSString* title = [sender titleForSegmentAtIndex:[sender selectedSegmentIndex]];
  SEL sel = NSSelectorFromString([NSString stringWithFormat:@"%@Color", [title lowercaseString]]);
  UIColor* color = [UIColor performSelector:sel];
  [window setBackgroundColor:color];
}

- (void) pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
  NSArray* colors = [@"aliceBlue alizarin amaranth amber amethyst apricot aqua aquamarine armyGreen asparagus atomicTangerine auburn azure azureWeb babyBlue beige bistre black blue pigmentBlue rybBlue blueGreen blueViolet bondiBlue brass brightGreen brightPink brightTurquoise brilliantRose britishRacingGreen bronze brown buff burgundy burntOrange burntSienna burntUmber camouflageGreen caputMortuum cardinal carmine carnationPink carolinaBlue carrotOrange celadon cerise cerulean ceruleanBlue champagne charcoal chartreuse chartreuseWeb cherryBlossomPink chestnut chocolate cinnabar cinnamon cobalt columbiaBlue copper copperRose coral coralRed corn cornflowerBlue cosmicLatte cream crimson cyan processCyan darkBlue darkBrown darkCerulean darkChestnut darkCoral darkGoldenrod darkGreen darkKhaki darkPastelGreen darkPink darkScarlet darkSalmon darkSlateGray darkSpringGreen darkTan darkTurquoise darkViolet deepCerise deepChestnut deepFuchsia deepLilac deepMagenta deepPeach deepPink denim dodgerBlue ecru egyptianBlue electricBlue electricGreen electricIndigo electricLime electricPurple emerald eggplant faluRed fernGreen firebrick flax forestGreen frenchRose fuchsia fuchsiaPink gamboge metallicGold goldWeb goldenBrown goldenYellow goldenrod greyAsparagus green greenWeb pigmentGreen rybGreen greenYellow grey hanPurple harlequin heliotrope hollywoodCerise hotMagenta hotPink indigo indigoWeb internationalKleinBlue internationalOrange islamicGreen ivory jade kellyGreen khaki lightKhaki lavender lavenderWeb lavenderBlue lavenderBlush lavenderGrey lavenderMagenta lavenderPink lavenderPurple lavenderRose lawnGreen lemon lemonChiffon lightBlue lightPink lilac lime limeWeb limeGreen linen magenta magentaDye processMagenta magicMint magnolia malachite maroonWeb maroon mayaBlue mauve mauveTaupe mediumBlue mediumCarmine mediumLavenderMagenta mediumPurple mediumSpringGreen midnightBlue mintGreen mistyRose mossGreen mountbattenPink mustard myrtle navajoWhite navyBlue ochre officeGreen oldGold oldLace oldLavender oldRose olive oliveDrab olivine orange rybOrange orangeWeb orangePeel orangeRed orchid paleBlue paleBrown paleCarmine paleChestnut paleCornflowerBlue paleMagenta palePink paleRedViolet papayaWhip pastelGreen pastelPink peach peachOrange peachYellow pear periwinkle persianBlue persianGreen persianIndigo persianOrange persianRed persianPink persianRose persimmon pineGreen pink pinkOrange platinum plum powderBlue puce prussianBlue psychedelicPurple pumpkin purpleWeb purple purpleTaupe rawUmber razzmatazz red pigmentRed rybRed redBiolet richCarmine robinEggBlue rose roseMadder roseTaupe royalBlue royalPurple ruby russet rust safetyOrange blazeOrange saffron salmon sandyBrown sangria sapphire scarlet schoolBusYellow seaGreen seashell selectiveYellow sepia shamrockGreen shockingPink silver skyBlue slateGrey smalt springBud springGreen steelBlue tan tangerine tangerineYellow taupe teaGreen teaRoseOrange teaRose teal tawny terraCotta thistle tomato turquoise tyrianPurple ultramarine unitedNationsBlue vegasGold vermilion violet violetWeb rybViolet viridian wheat white wisteria yellow processYellow rybYellow yellowGreen zinnwaldite" componentsSeparatedByString:@" "];
  [window setBackgroundColor:[UIColor performSelector:NSSelectorFromString([colors objectAtIndex:row])]];
}

- (UIView *) pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view {
  NSArray* colors = [@"aliceBlue alizarin amaranth amber amethyst apricot aqua aquamarine armyGreen asparagus atomicTangerine auburn azure azureWeb babyBlue beige bistre black blue pigmentBlue rybBlue blueGreen blueViolet bondiBlue brass brightGreen brightPink brightTurquoise brilliantRose britishRacingGreen bronze brown buff burgundy burntOrange burntSienna burntUmber camouflageGreen caputMortuum cardinal carmine carnationPink carolinaBlue carrotOrange celadon cerise cerulean ceruleanBlue champagne charcoal chartreuse chartreuseWeb cherryBlossomPink chestnut chocolate cinnabar cinnamon cobalt columbiaBlue copper copperRose coral coralRed corn cornflowerBlue cosmicLatte cream crimson cyan processCyan darkBlue darkBrown darkCerulean darkChestnut darkCoral darkGoldenrod darkGreen darkKhaki darkPastelGreen darkPink darkScarlet darkSalmon darkSlateGray darkSpringGreen darkTan darkTurquoise darkViolet deepCerise deepChestnut deepFuchsia deepLilac deepMagenta deepPeach deepPink denim dodgerBlue ecru egyptianBlue electricBlue electricGreen electricIndigo electricLime electricPurple emerald eggplant faluRed fernGreen firebrick flax forestGreen frenchRose fuchsia fuchsiaPink gamboge metallicGold goldWeb goldenBrown goldenYellow goldenrod greyAsparagus green greenWeb pigmentGreen rybGreen greenYellow grey hanPurple harlequin heliotrope hollywoodCerise hotMagenta hotPink indigo indigoWeb internationalKleinBlue internationalOrange islamicGreen ivory jade kellyGreen khaki lightKhaki lavender lavenderWeb lavenderBlue lavenderBlush lavenderGrey lavenderMagenta lavenderPink lavenderPurple lavenderRose lawnGreen lemon lemonChiffon lightBlue lightPink lilac lime limeWeb limeGreen linen magenta magentaDye processMagenta magicMint magnolia malachite maroonWeb maroon mayaBlue mauve mauveTaupe mediumBlue mediumCarmine mediumLavenderMagenta mediumPurple mediumSpringGreen midnightBlue mintGreen mistyRose mossGreen mountbattenPink mustard myrtle navajoWhite navyBlue ochre officeGreen oldGold oldLace oldLavender oldRose olive oliveDrab olivine orange rybOrange orangeWeb orangePeel orangeRed orchid paleBlue paleBrown paleCarmine paleChestnut paleCornflowerBlue paleMagenta palePink paleRedViolet papayaWhip pastelGreen pastelPink peach peachOrange peachYellow pear periwinkle persianBlue persianGreen persianIndigo persianOrange persianRed persianPink persianRose persimmon pineGreen pink pinkOrange platinum plum powderBlue puce prussianBlue psychedelicPurple pumpkin purpleWeb purple purpleTaupe rawUmber razzmatazz red pigmentRed rybRed redBiolet richCarmine robinEggBlue rose roseMadder roseTaupe royalBlue royalPurple ruby russet rust safetyOrange blazeOrange saffron salmon sandyBrown sangria sapphire scarlet schoolBusYellow seaGreen seashell selectiveYellow sepia shamrockGreen shockingPink silver skyBlue slateGrey smalt springBud springGreen steelBlue tan tangerine tangerineYellow taupe teaGreen teaRoseOrange teaRose teal tawny terraCotta thistle tomato turquoise tyrianPurple ultramarine unitedNationsBlue vegasGold vermilion violet violetWeb rybViolet viridian wheat white wisteria yellow processYellow rybYellow yellowGreen zinnwaldite" componentsSeparatedByString:@" "];
  CGRect rect = CGRectInset([pickerView frame], 20, 85);
  UILabel* label = [[UILabel alloc] initWithFrame:rect];
  label.font = [UIFont systemFontOfSize:18];
  label.text = [colors objectAtIndex:row];
  label.textColor = [UIColor blackColor];
  label.backgroundColor = [UIColor performSelector:NSSelectorFromString(label.text)];
  label.textAlignment = UITextAlignmentCenter;
  return label;
}

- (NSInteger) pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
  return 306;
}

@end