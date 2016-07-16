#import <Foundation/Foundation.h>
#import "USAdditions.h"
#import <libxml/tree.h>
#import "USGlobals.h"
@class FaceTokenDemoServiceSvc_getPictures;
@class FaceTokenDemoServiceSvc_getPicturesResponse;
@class FaceTokenDemoServiceSvc_getPicturesBase;
@class FaceTokenDemoServiceSvc_getPicturesBaseResponse;
@class FaceTokenDemoServiceSvc_queryUserStateBase;
@class FaceTokenDemoServiceSvc_queryUserStateBaseResponse;
@class FaceTokenDemoServiceSvc_ocrRegistWithIdentityBase;
@class FaceTokenDemoServiceSvc_ocrRegistWithIdentityBaseResponse;
@class FaceTokenDemoServiceSvc_SetPictureFilmBase;
@class FaceTokenDemoServiceSvc_SetPictureFilmBaseResponse;
@class FaceTokenDemoServiceSvc_SetPictureFilm;
@class FaceTokenDemoServiceSvc_SetPictureFilmResponse;
@class FaceTokenDemoServiceSvc_setComparePictureBase;
@class FaceTokenDemoServiceSvc_setComparePictureBaseResponse;
@class FaceTokenDemoServiceSvc_queryUserState;
@class FaceTokenDemoServiceSvc_queryUserStateResponse;
@class FaceTokenDemoServiceSvc_ocrRegistWithIdentity;
@class FaceTokenDemoServiceSvc_ocrRegistWithIdentityResponse;
@class FaceTokenDemoServiceSvc_registerUserBase;
@class FaceTokenDemoServiceSvc_registerUserBaseResponse;
@class FaceTokenDemoServiceSvc_createPoliceFace;
@class FaceTokenDemoServiceSvc_createPoliceFaceResponse;
@class FaceTokenDemoServiceSvc_setComparePicture;
@class FaceTokenDemoServiceSvc_setComparePictureResponse;
@class FaceTokenDemoServiceSvc_authFace;
@class FaceTokenDemoServiceSvc_authFaceResponse;
@class FaceTokenDemoServiceSvc_authFaceBase;
@class FaceTokenDemoServiceSvc_authFaceBaseResponse;
@class FaceTokenDemoServiceSvc_createPoliceFaceBase;
@class FaceTokenDemoServiceSvc_createPoliceFaceBaseResponse;
@class FaceTokenDemoServiceSvc_syncToken;
@class FaceTokenDemoServiceSvc_syncTokenResponse;
@class FaceTokenDemoServiceSvc_registerUser;
@class FaceTokenDemoServiceSvc_registerUserResponse;
@interface FaceTokenDemoServiceSvc_getPictures : NSObject {
	
/* elements */
	NSString * arg0;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (FaceTokenDemoServiceSvc_getPictures *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) NSString * arg0;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface FaceTokenDemoServiceSvc_getPicturesResponse : NSObject {
	
/* elements */
	NSString * return_;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (FaceTokenDemoServiceSvc_getPicturesResponse *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) NSString * return_;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface FaceTokenDemoServiceSvc_getPicturesBase : NSObject {
	
/* elements */
	NSString * arg0;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (FaceTokenDemoServiceSvc_getPicturesBase *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) NSString * arg0;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface FaceTokenDemoServiceSvc_getPicturesBaseResponse : NSObject {
	
/* elements */
	NSString * return_;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (FaceTokenDemoServiceSvc_getPicturesBaseResponse *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) NSString * return_;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface FaceTokenDemoServiceSvc_queryUserStateBase : NSObject {
	
/* elements */
	NSString * arg0;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (FaceTokenDemoServiceSvc_queryUserStateBase *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) NSString * arg0;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface FaceTokenDemoServiceSvc_queryUserStateBaseResponse : NSObject {
	
/* elements */
	NSString * return_;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (FaceTokenDemoServiceSvc_queryUserStateBaseResponse *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) NSString * return_;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface FaceTokenDemoServiceSvc_ocrRegistWithIdentityBase : NSObject {
	
/* elements */
	NSString * arg0;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (FaceTokenDemoServiceSvc_ocrRegistWithIdentityBase *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) NSString * arg0;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface FaceTokenDemoServiceSvc_ocrRegistWithIdentityBaseResponse : NSObject {
	
/* elements */
	NSString * return_;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (FaceTokenDemoServiceSvc_ocrRegistWithIdentityBaseResponse *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) NSString * return_;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface FaceTokenDemoServiceSvc_SetPictureFilmBase : NSObject {
	
/* elements */
	NSString * arg0;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (FaceTokenDemoServiceSvc_SetPictureFilmBase *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) NSString * arg0;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface FaceTokenDemoServiceSvc_SetPictureFilmBaseResponse : NSObject {
	
/* elements */
	NSString * return_;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (FaceTokenDemoServiceSvc_SetPictureFilmBaseResponse *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) NSString * return_;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface FaceTokenDemoServiceSvc_SetPictureFilm : NSObject {
	
/* elements */
	NSString * arg0;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (FaceTokenDemoServiceSvc_SetPictureFilm *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) NSString * arg0;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface FaceTokenDemoServiceSvc_SetPictureFilmResponse : NSObject {
	
/* elements */
	NSString * return_;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (FaceTokenDemoServiceSvc_SetPictureFilmResponse *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) NSString * return_;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface FaceTokenDemoServiceSvc_setComparePictureBase : NSObject {
	
/* elements */
	NSString * arg0;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (FaceTokenDemoServiceSvc_setComparePictureBase *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) NSString * arg0;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface FaceTokenDemoServiceSvc_setComparePictureBaseResponse : NSObject {
	
/* elements */
	NSString * return_;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (FaceTokenDemoServiceSvc_setComparePictureBaseResponse *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) NSString * return_;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface FaceTokenDemoServiceSvc_queryUserState : NSObject {
	
/* elements */
	NSString * arg0;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (FaceTokenDemoServiceSvc_queryUserState *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) NSString * arg0;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface FaceTokenDemoServiceSvc_queryUserStateResponse : NSObject {
	
/* elements */
	NSString * return_;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (FaceTokenDemoServiceSvc_queryUserStateResponse *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) NSString * return_;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface FaceTokenDemoServiceSvc_ocrRegistWithIdentity : NSObject {
	
/* elements */
	NSString * arg0;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (FaceTokenDemoServiceSvc_ocrRegistWithIdentity *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) NSString * arg0;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface FaceTokenDemoServiceSvc_ocrRegistWithIdentityResponse : NSObject {
	
/* elements */
	NSString * return_;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (FaceTokenDemoServiceSvc_ocrRegistWithIdentityResponse *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) NSString * return_;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface FaceTokenDemoServiceSvc_registerUserBase : NSObject {
	
/* elements */
	NSString * arg0;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (FaceTokenDemoServiceSvc_registerUserBase *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) NSString * arg0;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface FaceTokenDemoServiceSvc_registerUserBaseResponse : NSObject {
	
/* elements */
	NSString * return_;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (FaceTokenDemoServiceSvc_registerUserBaseResponse *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) NSString * return_;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface FaceTokenDemoServiceSvc_createPoliceFace : NSObject {
	
/* elements */
	NSString * arg0;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (FaceTokenDemoServiceSvc_createPoliceFace *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) NSString * arg0;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface FaceTokenDemoServiceSvc_createPoliceFaceResponse : NSObject {
	
/* elements */
	NSString * return_;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (FaceTokenDemoServiceSvc_createPoliceFaceResponse *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) NSString * return_;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface FaceTokenDemoServiceSvc_setComparePicture : NSObject {
	
/* elements */
	NSString * arg0;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (FaceTokenDemoServiceSvc_setComparePicture *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) NSString * arg0;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface FaceTokenDemoServiceSvc_setComparePictureResponse : NSObject {
	
/* elements */
	NSString * return_;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (FaceTokenDemoServiceSvc_setComparePictureResponse *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) NSString * return_;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface FaceTokenDemoServiceSvc_authFace : NSObject {
	
/* elements */
	NSString * arg0;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (FaceTokenDemoServiceSvc_authFace *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) NSString * arg0;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface FaceTokenDemoServiceSvc_authFaceResponse : NSObject {
	
/* elements */
	NSString * return_;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (FaceTokenDemoServiceSvc_authFaceResponse *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) NSString * return_;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface FaceTokenDemoServiceSvc_authFaceBase : NSObject {
	
/* elements */
	NSString * arg0;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (FaceTokenDemoServiceSvc_authFaceBase *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) NSString * arg0;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface FaceTokenDemoServiceSvc_authFaceBaseResponse : NSObject {
	
/* elements */
	NSString * return_;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (FaceTokenDemoServiceSvc_authFaceBaseResponse *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) NSString * return_;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface FaceTokenDemoServiceSvc_createPoliceFaceBase : NSObject {
	
/* elements */
	NSString * arg0;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (FaceTokenDemoServiceSvc_createPoliceFaceBase *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) NSString * arg0;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface FaceTokenDemoServiceSvc_createPoliceFaceBaseResponse : NSObject {
	
/* elements */
	NSString * return_;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (FaceTokenDemoServiceSvc_createPoliceFaceBaseResponse *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) NSString * return_;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface FaceTokenDemoServiceSvc_syncToken : NSObject {
	
/* elements */
	NSString * arg0;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (FaceTokenDemoServiceSvc_syncToken *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) NSString * arg0;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface FaceTokenDemoServiceSvc_syncTokenResponse : NSObject {
	
/* elements */
	NSString * return_;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (FaceTokenDemoServiceSvc_syncTokenResponse *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) NSString * return_;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface FaceTokenDemoServiceSvc_registerUser : NSObject {
	
/* elements */
	NSString * arg0;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (FaceTokenDemoServiceSvc_registerUser *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) NSString * arg0;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface FaceTokenDemoServiceSvc_registerUserResponse : NSObject {
	
/* elements */
	NSString * return_;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (FaceTokenDemoServiceSvc_registerUserResponse *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) NSString * return_;
/* attributes */
- (NSDictionary *)attributes;
@end
/* Cookies handling provided by http://en.wikibooks.org/wiki/Programming:WebObjects/Web_Services/Web_Service_Provider */
#import <libxml/parser.h>
#import "xsd.h"
#import "FaceTokenDemoServiceSvc.h"
@class FaceTokenDemoServiceSoapBinding;
@interface FaceTokenDemoServiceSvc : NSObject {
	
}
+ (FaceTokenDemoServiceSoapBinding *)FaceTokenDemoServiceSoapBinding;
@end
@class FaceTokenDemoServiceSoapBindingResponse;
@class FaceTokenDemoServiceSoapBindingOperation;
@protocol FaceTokenDemoServiceSoapBindingResponseDelegate <NSObject>
- (void) operation:(FaceTokenDemoServiceSoapBindingOperation *)operation completedWithResponse:(FaceTokenDemoServiceSoapBindingResponse *)response;
@end
@interface FaceTokenDemoServiceSoapBinding : NSObject <FaceTokenDemoServiceSoapBindingResponseDelegate> {
	NSURL *address;
	NSTimeInterval defaultTimeout;
	NSMutableArray *cookies;
	BOOL logXMLInOut;
	BOOL synchronousOperationComplete;
	NSString *authUsername;
	NSString *authPassword;
}
@property (copy) NSURL *address;
@property (assign) BOOL logXMLInOut;
@property (assign) NSTimeInterval defaultTimeout;
@property (nonatomic, retain) NSMutableArray *cookies;
@property (nonatomic, retain) NSString *authUsername;
@property (nonatomic, retain) NSString *authPassword;
- (id)initWithAddress:(NSString *)anAddress;
- (void)sendHTTPCallUsingBody:(NSString *)body soapAction:(NSString *)soapAction forOperation:(FaceTokenDemoServiceSoapBindingOperation *)operation;
- (void)addCookie:(NSHTTPCookie *)toAdd;
- (FaceTokenDemoServiceSoapBindingResponse *)getPicturesUsingParameters:(FaceTokenDemoServiceSvc_getPictures *)aParameters ;
- (void)getPicturesAsyncUsingParameters:(FaceTokenDemoServiceSvc_getPictures *)aParameters  delegate:(id<FaceTokenDemoServiceSoapBindingResponseDelegate>)responseDelegate;
- (FaceTokenDemoServiceSoapBindingResponse *)getPicturesBaseUsingParameters:(FaceTokenDemoServiceSvc_getPicturesBase *)aParameters ;
- (void)getPicturesBaseAsyncUsingParameters:(FaceTokenDemoServiceSvc_getPicturesBase *)aParameters  delegate:(id<FaceTokenDemoServiceSoapBindingResponseDelegate>)responseDelegate;
- (FaceTokenDemoServiceSoapBindingResponse *)queryUserStateBaseUsingParameters:(FaceTokenDemoServiceSvc_queryUserStateBase *)aParameters ;
- (void)queryUserStateBaseAsyncUsingParameters:(FaceTokenDemoServiceSvc_queryUserStateBase *)aParameters  delegate:(id<FaceTokenDemoServiceSoapBindingResponseDelegate>)responseDelegate;
- (FaceTokenDemoServiceSoapBindingResponse *)ocrRegistWithIdentityBaseUsingParameters:(FaceTokenDemoServiceSvc_ocrRegistWithIdentityBase *)aParameters ;
- (void)ocrRegistWithIdentityBaseAsyncUsingParameters:(FaceTokenDemoServiceSvc_ocrRegistWithIdentityBase *)aParameters  delegate:(id<FaceTokenDemoServiceSoapBindingResponseDelegate>)responseDelegate;
- (FaceTokenDemoServiceSoapBindingResponse *)SetPictureFilmBaseUsingParameters:(FaceTokenDemoServiceSvc_SetPictureFilmBase *)aParameters ;
- (void)SetPictureFilmBaseAsyncUsingParameters:(FaceTokenDemoServiceSvc_SetPictureFilmBase *)aParameters  delegate:(id<FaceTokenDemoServiceSoapBindingResponseDelegate>)responseDelegate;
- (FaceTokenDemoServiceSoapBindingResponse *)SetPictureFilmUsingParameters:(FaceTokenDemoServiceSvc_SetPictureFilm *)aParameters ;
- (void)SetPictureFilmAsyncUsingParameters:(FaceTokenDemoServiceSvc_SetPictureFilm *)aParameters  delegate:(id<FaceTokenDemoServiceSoapBindingResponseDelegate>)responseDelegate;
- (FaceTokenDemoServiceSoapBindingResponse *)setComparePictureBaseUsingParameters:(FaceTokenDemoServiceSvc_setComparePictureBase *)aParameters ;
- (void)setComparePictureBaseAsyncUsingParameters:(FaceTokenDemoServiceSvc_setComparePictureBase *)aParameters  delegate:(id<FaceTokenDemoServiceSoapBindingResponseDelegate>)responseDelegate;
- (FaceTokenDemoServiceSoapBindingResponse *)queryUserStateUsingParameters:(FaceTokenDemoServiceSvc_queryUserState *)aParameters ;
- (void)queryUserStateAsyncUsingParameters:(FaceTokenDemoServiceSvc_queryUserState *)aParameters  delegate:(id<FaceTokenDemoServiceSoapBindingResponseDelegate>)responseDelegate;
- (FaceTokenDemoServiceSoapBindingResponse *)ocrRegistWithIdentityUsingParameters:(FaceTokenDemoServiceSvc_ocrRegistWithIdentity *)aParameters ;
- (void)ocrRegistWithIdentityAsyncUsingParameters:(FaceTokenDemoServiceSvc_ocrRegistWithIdentity *)aParameters  delegate:(id<FaceTokenDemoServiceSoapBindingResponseDelegate>)responseDelegate;
- (FaceTokenDemoServiceSoapBindingResponse *)registerUserBaseUsingParameters:(FaceTokenDemoServiceSvc_registerUserBase *)aParameters ;
- (void)registerUserBaseAsyncUsingParameters:(FaceTokenDemoServiceSvc_registerUserBase *)aParameters  delegate:(id<FaceTokenDemoServiceSoapBindingResponseDelegate>)responseDelegate;
- (FaceTokenDemoServiceSoapBindingResponse *)createPoliceFaceUsingParameters:(FaceTokenDemoServiceSvc_createPoliceFace *)aParameters ;
- (void)createPoliceFaceAsyncUsingParameters:(FaceTokenDemoServiceSvc_createPoliceFace *)aParameters  delegate:(id<FaceTokenDemoServiceSoapBindingResponseDelegate>)responseDelegate;
- (FaceTokenDemoServiceSoapBindingResponse *)setComparePictureUsingParameters:(FaceTokenDemoServiceSvc_setComparePicture *)aParameters ;
- (void)setComparePictureAsyncUsingParameters:(FaceTokenDemoServiceSvc_setComparePicture *)aParameters  delegate:(id<FaceTokenDemoServiceSoapBindingResponseDelegate>)responseDelegate;
- (FaceTokenDemoServiceSoapBindingResponse *)authFaceUsingParameters:(FaceTokenDemoServiceSvc_authFace *)aParameters ;
- (void)authFaceAsyncUsingParameters:(FaceTokenDemoServiceSvc_authFace *)aParameters  delegate:(id<FaceTokenDemoServiceSoapBindingResponseDelegate>)responseDelegate;
- (FaceTokenDemoServiceSoapBindingResponse *)authFaceBaseUsingParameters:(FaceTokenDemoServiceSvc_authFaceBase *)aParameters ;
- (void)authFaceBaseAsyncUsingParameters:(FaceTokenDemoServiceSvc_authFaceBase *)aParameters  delegate:(id<FaceTokenDemoServiceSoapBindingResponseDelegate>)responseDelegate;
- (FaceTokenDemoServiceSoapBindingResponse *)createPoliceFaceBaseUsingParameters:(FaceTokenDemoServiceSvc_createPoliceFaceBase *)aParameters ;
- (void)createPoliceFaceBaseAsyncUsingParameters:(FaceTokenDemoServiceSvc_createPoliceFaceBase *)aParameters  delegate:(id<FaceTokenDemoServiceSoapBindingResponseDelegate>)responseDelegate;
- (FaceTokenDemoServiceSoapBindingResponse *)syncTokenUsingParameters:(FaceTokenDemoServiceSvc_syncToken *)aParameters ;
- (void)syncTokenAsyncUsingParameters:(FaceTokenDemoServiceSvc_syncToken *)aParameters  delegate:(id<FaceTokenDemoServiceSoapBindingResponseDelegate>)responseDelegate;
- (FaceTokenDemoServiceSoapBindingResponse *)registerUserUsingParameters:(FaceTokenDemoServiceSvc_registerUser *)aParameters ;
- (void)registerUserAsyncUsingParameters:(FaceTokenDemoServiceSvc_registerUser *)aParameters  delegate:(id<FaceTokenDemoServiceSoapBindingResponseDelegate>)responseDelegate;
@end
@interface FaceTokenDemoServiceSoapBindingOperation : NSOperation {
	FaceTokenDemoServiceSoapBinding *binding;
	FaceTokenDemoServiceSoapBindingResponse *response;
	id<FaceTokenDemoServiceSoapBindingResponseDelegate> delegate;
	NSMutableData *responseData;
	NSURLConnection *urlConnection;
}
@property (retain) FaceTokenDemoServiceSoapBinding *binding;
@property (readonly) FaceTokenDemoServiceSoapBindingResponse *response;
@property (nonatomic, assign) id<FaceTokenDemoServiceSoapBindingResponseDelegate> delegate;
@property (nonatomic, retain) NSMutableData *responseData;
@property (nonatomic, retain) NSURLConnection *urlConnection;
- (id)initWithBinding:(FaceTokenDemoServiceSoapBinding *)aBinding delegate:(id<FaceTokenDemoServiceSoapBindingResponseDelegate>)aDelegate;
@end
@interface FaceTokenDemoServiceSoapBinding_getPictures : FaceTokenDemoServiceSoapBindingOperation {
	FaceTokenDemoServiceSvc_getPictures * parameters;
}
@property (retain) FaceTokenDemoServiceSvc_getPictures * parameters;
- (id)initWithBinding:(FaceTokenDemoServiceSoapBinding *)aBinding delegate:(id<FaceTokenDemoServiceSoapBindingResponseDelegate>)aDelegate
	parameters:(FaceTokenDemoServiceSvc_getPictures *)aParameters
;
@end
@interface FaceTokenDemoServiceSoapBinding_getPicturesBase : FaceTokenDemoServiceSoapBindingOperation {
	FaceTokenDemoServiceSvc_getPicturesBase * parameters;
}
@property (retain) FaceTokenDemoServiceSvc_getPicturesBase * parameters;
- (id)initWithBinding:(FaceTokenDemoServiceSoapBinding *)aBinding delegate:(id<FaceTokenDemoServiceSoapBindingResponseDelegate>)aDelegate
	parameters:(FaceTokenDemoServiceSvc_getPicturesBase *)aParameters
;
@end
@interface FaceTokenDemoServiceSoapBinding_queryUserStateBase : FaceTokenDemoServiceSoapBindingOperation {
	FaceTokenDemoServiceSvc_queryUserStateBase * parameters;
}
@property (retain) FaceTokenDemoServiceSvc_queryUserStateBase * parameters;
- (id)initWithBinding:(FaceTokenDemoServiceSoapBinding *)aBinding delegate:(id<FaceTokenDemoServiceSoapBindingResponseDelegate>)aDelegate
	parameters:(FaceTokenDemoServiceSvc_queryUserStateBase *)aParameters
;
@end
@interface FaceTokenDemoServiceSoapBinding_ocrRegistWithIdentityBase : FaceTokenDemoServiceSoapBindingOperation {
	FaceTokenDemoServiceSvc_ocrRegistWithIdentityBase * parameters;
}
@property (retain) FaceTokenDemoServiceSvc_ocrRegistWithIdentityBase * parameters;
- (id)initWithBinding:(FaceTokenDemoServiceSoapBinding *)aBinding delegate:(id<FaceTokenDemoServiceSoapBindingResponseDelegate>)aDelegate
	parameters:(FaceTokenDemoServiceSvc_ocrRegistWithIdentityBase *)aParameters
;
@end
@interface FaceTokenDemoServiceSoapBinding_SetPictureFilmBase : FaceTokenDemoServiceSoapBindingOperation {
	FaceTokenDemoServiceSvc_SetPictureFilmBase * parameters;
}
@property (retain) FaceTokenDemoServiceSvc_SetPictureFilmBase * parameters;
- (id)initWithBinding:(FaceTokenDemoServiceSoapBinding *)aBinding delegate:(id<FaceTokenDemoServiceSoapBindingResponseDelegate>)aDelegate
	parameters:(FaceTokenDemoServiceSvc_SetPictureFilmBase *)aParameters
;
@end
@interface FaceTokenDemoServiceSoapBinding_SetPictureFilm : FaceTokenDemoServiceSoapBindingOperation {
	FaceTokenDemoServiceSvc_SetPictureFilm * parameters;
}
@property (retain) FaceTokenDemoServiceSvc_SetPictureFilm * parameters;
- (id)initWithBinding:(FaceTokenDemoServiceSoapBinding *)aBinding delegate:(id<FaceTokenDemoServiceSoapBindingResponseDelegate>)aDelegate
	parameters:(FaceTokenDemoServiceSvc_SetPictureFilm *)aParameters
;
@end
@interface FaceTokenDemoServiceSoapBinding_setComparePictureBase : FaceTokenDemoServiceSoapBindingOperation {
	FaceTokenDemoServiceSvc_setComparePictureBase * parameters;
}
@property (retain) FaceTokenDemoServiceSvc_setComparePictureBase * parameters;
- (id)initWithBinding:(FaceTokenDemoServiceSoapBinding *)aBinding delegate:(id<FaceTokenDemoServiceSoapBindingResponseDelegate>)aDelegate
	parameters:(FaceTokenDemoServiceSvc_setComparePictureBase *)aParameters
;
@end
@interface FaceTokenDemoServiceSoapBinding_queryUserState : FaceTokenDemoServiceSoapBindingOperation {
	FaceTokenDemoServiceSvc_queryUserState * parameters;
}
@property (retain) FaceTokenDemoServiceSvc_queryUserState * parameters;
- (id)initWithBinding:(FaceTokenDemoServiceSoapBinding *)aBinding delegate:(id<FaceTokenDemoServiceSoapBindingResponseDelegate>)aDelegate
	parameters:(FaceTokenDemoServiceSvc_queryUserState *)aParameters
;
@end
@interface FaceTokenDemoServiceSoapBinding_ocrRegistWithIdentity : FaceTokenDemoServiceSoapBindingOperation {
	FaceTokenDemoServiceSvc_ocrRegistWithIdentity * parameters;
}
@property (retain) FaceTokenDemoServiceSvc_ocrRegistWithIdentity * parameters;
- (id)initWithBinding:(FaceTokenDemoServiceSoapBinding *)aBinding delegate:(id<FaceTokenDemoServiceSoapBindingResponseDelegate>)aDelegate
	parameters:(FaceTokenDemoServiceSvc_ocrRegistWithIdentity *)aParameters
;
@end
@interface FaceTokenDemoServiceSoapBinding_registerUserBase : FaceTokenDemoServiceSoapBindingOperation {
	FaceTokenDemoServiceSvc_registerUserBase * parameters;
}
@property (retain) FaceTokenDemoServiceSvc_registerUserBase * parameters;
- (id)initWithBinding:(FaceTokenDemoServiceSoapBinding *)aBinding delegate:(id<FaceTokenDemoServiceSoapBindingResponseDelegate>)aDelegate
	parameters:(FaceTokenDemoServiceSvc_registerUserBase *)aParameters
;
@end
@interface FaceTokenDemoServiceSoapBinding_createPoliceFace : FaceTokenDemoServiceSoapBindingOperation {
	FaceTokenDemoServiceSvc_createPoliceFace * parameters;
}
@property (retain) FaceTokenDemoServiceSvc_createPoliceFace * parameters;
- (id)initWithBinding:(FaceTokenDemoServiceSoapBinding *)aBinding delegate:(id<FaceTokenDemoServiceSoapBindingResponseDelegate>)aDelegate
	parameters:(FaceTokenDemoServiceSvc_createPoliceFace *)aParameters
;
@end
@interface FaceTokenDemoServiceSoapBinding_setComparePicture : FaceTokenDemoServiceSoapBindingOperation {
	FaceTokenDemoServiceSvc_setComparePicture * parameters;
}
@property (retain) FaceTokenDemoServiceSvc_setComparePicture * parameters;
- (id)initWithBinding:(FaceTokenDemoServiceSoapBinding *)aBinding delegate:(id<FaceTokenDemoServiceSoapBindingResponseDelegate>)aDelegate
	parameters:(FaceTokenDemoServiceSvc_setComparePicture *)aParameters
;
@end
@interface FaceTokenDemoServiceSoapBinding_authFace : FaceTokenDemoServiceSoapBindingOperation {
	FaceTokenDemoServiceSvc_authFace * parameters;
}
@property (retain) FaceTokenDemoServiceSvc_authFace * parameters;
- (id)initWithBinding:(FaceTokenDemoServiceSoapBinding *)aBinding delegate:(id<FaceTokenDemoServiceSoapBindingResponseDelegate>)aDelegate
	parameters:(FaceTokenDemoServiceSvc_authFace *)aParameters
;
@end
@interface FaceTokenDemoServiceSoapBinding_authFaceBase : FaceTokenDemoServiceSoapBindingOperation {
	FaceTokenDemoServiceSvc_authFaceBase * parameters;
}
@property (retain) FaceTokenDemoServiceSvc_authFaceBase * parameters;
- (id)initWithBinding:(FaceTokenDemoServiceSoapBinding *)aBinding delegate:(id<FaceTokenDemoServiceSoapBindingResponseDelegate>)aDelegate
	parameters:(FaceTokenDemoServiceSvc_authFaceBase *)aParameters
;
@end
@interface FaceTokenDemoServiceSoapBinding_createPoliceFaceBase : FaceTokenDemoServiceSoapBindingOperation {
	FaceTokenDemoServiceSvc_createPoliceFaceBase * parameters;
}
@property (retain) FaceTokenDemoServiceSvc_createPoliceFaceBase * parameters;
- (id)initWithBinding:(FaceTokenDemoServiceSoapBinding *)aBinding delegate:(id<FaceTokenDemoServiceSoapBindingResponseDelegate>)aDelegate
	parameters:(FaceTokenDemoServiceSvc_createPoliceFaceBase *)aParameters
;
@end
@interface FaceTokenDemoServiceSoapBinding_syncToken : FaceTokenDemoServiceSoapBindingOperation {
	FaceTokenDemoServiceSvc_syncToken * parameters;
}
@property (retain) FaceTokenDemoServiceSvc_syncToken * parameters;
- (id)initWithBinding:(FaceTokenDemoServiceSoapBinding *)aBinding delegate:(id<FaceTokenDemoServiceSoapBindingResponseDelegate>)aDelegate
	parameters:(FaceTokenDemoServiceSvc_syncToken *)aParameters
;
@end
@interface FaceTokenDemoServiceSoapBinding_registerUser : FaceTokenDemoServiceSoapBindingOperation {
	FaceTokenDemoServiceSvc_registerUser * parameters;
}
@property (retain) FaceTokenDemoServiceSvc_registerUser * parameters;
- (id)initWithBinding:(FaceTokenDemoServiceSoapBinding *)aBinding delegate:(id<FaceTokenDemoServiceSoapBindingResponseDelegate>)aDelegate
	parameters:(FaceTokenDemoServiceSvc_registerUser *)aParameters
;
@end
@interface FaceTokenDemoServiceSoapBinding_envelope : NSObject {
}
+ (FaceTokenDemoServiceSoapBinding_envelope *)sharedInstance;
- (NSString *)serializedFormUsingHeaderElements:(NSDictionary *)headerElements bodyElements:(NSDictionary *)bodyElements;
@end
@interface FaceTokenDemoServiceSoapBindingResponse : NSObject {
	NSArray *headers;
	NSArray *bodyParts;
	NSError *error;
}
@property (retain) NSArray *headers;
@property (retain) NSArray *bodyParts;
@property (retain) NSError *error;
@end
