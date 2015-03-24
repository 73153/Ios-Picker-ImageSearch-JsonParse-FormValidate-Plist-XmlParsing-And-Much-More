/***************************************************************************/
/*                                                                         */
/*  JMFFace.h                                                              */
/*  Copyright (c) 2014 Simarks. All rights reserved.                       */
/*                                                                         */
/*  Description: JMFCameraIOS                                              */
/*               U-Tad - Práctica iOS Avanzado                             */
/*               CoreData Face Entity Class definition file                */
/*                                                                         */
/*       Author: Jorge Marcos Fernandez                                    */
/*         NOTE: Generated by mogenerator                                  */
/*                                                                         */
/***************************************************************************/
#import "_JMFFace.h"

/***************************************************************************/
/*                                                                         */
/*                                                                         */
/*  JMFFace Flags                                                          */
/*                                                                         */
/*                                                                         */
/***************************************************************************/
#define FACEFLAG_HAS_LEFT_EYE                               0x00000001
#define FACEFLAG_HAS_RIGHT_EYE                              0x00000002
#define FACEFLAG_HAS_MOUTH                                  0x00000004
#define FACEFLAG_HAS_TRACKING_ID                            0x00000008
#define FACEFLAG_HAS_TRACKING_FRAME_COUNT                   0x00000010
#define FACEFLAG_HAS_FACE_ANGLE                             0x00000020
#define FACEFLAG_HAS_SMILE                                  0x00000040
#define FACEFLAG_HAS_LEFT_EYE_CLOSED                        0x00000080
#define FACEFLAG_HAS_RIGHT_EYE_CLOSED                       0x00000100

/***************************************************************************/
/*                                                                         */
/*                                                                         */
/*                                                                         */
/*                                                                         */
/*  JMFFace Class Interface                                                */
/*                                                                         */
/*                                                                         */
/*                                                                         */
/*                                                                         */
/***************************************************************************/
@interface JMFFace : _JMFFace
{

}

/***************************************************************************/
/*                                                                         */
/*                                                                         */
/*  Initialization Methods                                                 */
/*                                                                         */
/*                                                                         */
/***************************************************************************/
+ (instancetype)faceWithName:(NSString*)name feature:(CIFaceFeature*)feature photo:(JMFPhoto*)photo inContext:(NSManagedObjectContext*)context;

/***************************************************************************/
/*                                                                         */
/*                                                                         */
/*  Instance Methods                                                       */
/*                                                                         */
/*                                                                         */
/***************************************************************************/
- (BOOL)hasLeftEye;
- (BOOL)hasRightEye;
- (BOOL)hasMouth;
- (BOOL)hasTrackingId;
- (BOOL)hasTrackingFrameCount;
- (BOOL)hasFaceAngle;
- (BOOL)hasSmile;
- (BOOL)hasLeftEyeClosed;
- (BOOL)hasRightEyeClosed;

@end