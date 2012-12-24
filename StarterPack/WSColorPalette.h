//
//  WSColorPalette.h
//  Reminders Metro
//
//  Created by Cristian A Monterroza on 9/20/12.
//  Copyright (c) 2012 wrkstrm. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
	kWSGradientWhite = 1,
	kWSGradientGreen,
	kWSGradientLightBlue,
	kWSGradientRed,
	kWSGradientBlack,
	kWSGradientNavyBlue,
	kWSGradientPink,
	kWSGradientYellow
} kWSGradient;

enum {
	kWSAgendaRecuperate = 1,
	kWSAgendaWork,
	kWSAgendaSocial,
	kWSAgendaExercise,
	kWSAgendaDeadTime,
	kWSAgendaCivic,
	kWSAgendaFamily,
	kWSAgendaReligion
};

@interface WSColorPalette : NSObject

+ (UIColor *) colorForAgenda: (int) wrkstrmConstant forCell: (int) cellRow;
+ (UIColor *) colorGradient: (kWSGradient) colorGradient forCell: (int) cellRow;

@end