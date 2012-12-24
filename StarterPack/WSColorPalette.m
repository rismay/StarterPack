//
//  WSColorPalette.m
//  Reminders Metro
//
//  Created by Cristian A Monterroza on 9/20/12.
//  Copyright (c) 2012 wrkstrm. All rights reserved.
//

#import "WSColorPalette.h"

@implementation WSColorPalette

+ (UIColor *) colorGradient: (kWSGradient) colorGradient forCell: (int) cellRow {
	//NSLog(@"WSA:colorForAgenda:forCell:BEGIN Color for Agenda : %@ and Cell: %i",[WSAgenda defaultNameForConstant:wrkstrmConstant], cellRow);
	switch (colorGradient) {
		case kWSGradientGreen: {
			return [UIColor colorWithRed:(25+(double)cellRow*10)/255 green:(190+(double)cellRow*11)/255 blue:(25+(double)cellRow*10)/255 alpha:1.0];
		} break;
		case kWSGradientLightBlue: {
			return [UIColor colorWithRed:(45+(double)cellRow*14)/255 green:(100+(double)cellRow*14)/255 blue:(215+(double)cellRow*10)/255 alpha:1.0];
		} break;
		case kWSGradientRed: {
			return [UIColor colorWithRed:(215+(double)cellRow*10)/255 green:(25+(double)cellRow*20)/255 blue:(25+(double)cellRow*10)/255 alpha:1.0];
		} break;
		case kWSGradientBlack: {
			return [UIColor colorWithRed:(65+(double)cellRow*8)/255 green:(65+(double)cellRow*8)/255 blue:(65+(double)cellRow*8)/255 alpha:1.0];
		} break;
		case kWSGradientWhite: {
			return [UIColor colorWithRed:(210-(double)cellRow*7)/255 green:(210-(double)cellRow*7)/255 blue:(210-(double)cellRow*7)/255 alpha:1.0];
		} break;
		default: {
			return [UIColor grayColor];
		} break;
	}
}

+ (UIColor *) colorForAgenda: (int) wrkstrmConstant forCell: (int) cellRow {
	//NSLog(@"WSA:colorForAgenda:forCell:BEGIN Color for Agenda : %@ and Cell: %i",[WSAgenda defaultNameForConstant:wrkstrmConstant], cellRow);
	if(wrkstrmConstant == (int) kWSAgendaWork) //Original:
		return [UIColor colorWithRed:(25+(double)cellRow*10)/255 green:(190+(double)cellRow*11)/255 blue:(25+(double)cellRow*10)/255 alpha:1.0];
	if(wrkstrmConstant == (int) kWSAgendaSocial)
		return [UIColor colorWithRed:(45+(double)cellRow*14)/255 green:(100+(double)cellRow*14)/255 blue:(215+(double)cellRow*10)/255 alpha:1.0];
	if(wrkstrmConstant == (int) kWSAgendaExercise) //Original: 217, 23, 23
		return [UIColor colorWithRed:(215+(double)cellRow*10)/255 green:(25+(double)cellRow*20)/255 blue:(25+(double)cellRow*10)/255 alpha:1.0];
	if(wrkstrmConstant == (int) kWSAgendaDeadTime)
		return [UIColor colorWithRed:(65+(double)cellRow*8)/255 green:(65+(double)cellRow*8)/255 blue:(65+(double)cellRow*8)/255 alpha:1.0];
	if(wrkstrmConstant == (int) kWSAgendaRecuperate)
		return [UIColor colorWithRed:(210-(double)cellRow*7)/255 green:(210-(double)cellRow*7)/255 blue:(210-(double)cellRow*7)/255 alpha:1.0];
	return [UIColor grayColor];
}

@end