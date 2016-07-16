#ifndef GLOBAL_TYPEDEF
#define GLOBAL_TYPEDEF

#include "stdio.h"
#include "string.h"
#include "stdlib.h"


#ifndef _API_EXPORTS
#define _API_EXPORTS
#endif

/* 获取证件类型*/
typedef enum
{
	TUNCERTAIN	  = 0x00,   /*未知*/
	TIDCARD2      = 0x11,   /*二代证*/
	TIDCARDBACK   = 0x14,   /*二代证背面*/
	TIDBANK       = 0x15,   /*银行卡*/
	TIDLPR        = 0x16,   /*车牌*/
	TIDJSZCARD    = 0x17,   /*驾照*/
	TIDXSZCARD    = 0x18,   /*行驶证*/
	TIDTICKET	  = 0x19,   /*行驶证*/
} TCARD_TYPE;

#ifdef _OCR_THR
#include "pthread.h"
typedef struct tagThreadStruct 
{
// 	void *SrcImage;
	char			*ImgPath;				//路径
	char			*DataStream;			//图片数据流
	int				StreamSize;				//图片数据流长度
	void			*pTopHandle;			//主结构
	TCARD_TYPE		nCardType;
	char			nResult[1024*1024];		//识别结果
}THREAD_PARAM;
#endif

#define	pNULL				((void *)0)
#define LENTH_VERSION_MAX	64   // 版本号长度

typedef unsigned char	SByte; /**<  无符号字符型 0 ~ 255(0xff)*/
typedef unsigned char	UChar; /**<  无符号字符型 0 ~ 255(0xff)*/
typedef unsigned char	Uchar; /**<  无符号字符型 0 ~ 255(0xff)*/
typedef unsigned short	UShort;/**<  无符号短整形0 ~ 65535(0xffff)*/
typedef unsigned short	Ushort;/**<  无符号短整型0 ~ 65535(0xffff)*/
typedef short			Short; /**<  短整型 -32768 ~ 32767*/
typedef short			Sint;  /**<  短整型 -32768 ~ 32767*/
typedef int				Int;   /**<  整形 2147483647~-2147483648*/
typedef long			Long;  /**<  长整形 -2147483648～2147483647*/
typedef unsigned long	ULong;  /**< 无符号长整形 0 ~ 4294967295*/
typedef unsigned int	UInt;  /**<  无符号整形 0 ~ 4294967295*/
typedef float           Float; /**<  浮点型 -3.40E+38 ~ +3.40E+38*/
/*typedef unsigned int	size_t;*/

/*坐标点*/
typedef struct tagImgROI
{
	Int   xOffset;  /*x位置*/
	Int   yOffset;  /*y位置*/
	Int   width;    /*宽度*/
	Int   height;	/*高度*/
}
ImgROI;

/*设置选项*/
typedef enum enumParam
{
	T_ONLY_CARD_NUM			  = 0x0001,/* 设置是否只识别卡号*/
	T_SET_HEADIMG			  = 0x0002,/* 设置是否要截取人头像信息*/
	/*T_SET_PRINTFLOG			  = 0x0003,/ * 设置是否保存log信息* 功能已废弃/*/
	T_SET_LOGPATH			  = 0x0004,/* 设置保存log保存文件位置*/
	/*T_SET_OPENORCLOSE_LOGPATH = 0x0005,/ * 打开关闭保存log文件功能* 功能已废弃/*/
	T_SET_HEADIMGBUFMODE      = 0x0006,/* 设置人头像模式 0= 原始形式(便于android ios直接加载)   1=BASE64加密形式(便于sdk网络传输)*/
	T_SET_NDCORRECTION        = 0x0007,/* 设置是否进行畸形矫正功能*/

	T_SET_BANK_RECMODE        = 0x0008,/* 设置银行卡引擎识别模式*/
	T_SET_BANK_AREA_LEFT      = 0x0009,/* 设置银行卡识别引擎区域左边坐标*/
	T_SET_BANK_AREA_TOP       = 0x0010,/* 设置银行卡识别引擎区域顶点坐标*/
	T_SET_BANK_AREA_WIDTH     = 0x0011,/* 设置银行卡识别引擎区域宽度*/
	T_SET_BANK_AREA_HEIGHT    = 0x0012,/* 设置银行卡识别引擎区域高度*/

	T_SET_BANK_LINE_STREAM	  = 0x0013,/* 设置是否以图片流的方式导出银行卡号行*/
}TPARAM;

/*身份证图像方向*/
typedef enum
{
	IMG_DIRECT_UP		= 0,
	IMG_DIRECT_RIGHT	= 1,
	IMG_DIRECT_BOTTOM	= 2,
	IMG_DIRECT_LEFT		= 3,
}TDIRECT_TYPE;

/*车牌颜色*/
typedef enum enumPlateColor
{
	BLUE_PLATE		= 1,/*蓝色*/
	YELLOW_PLATE	= 2,/*黄色*/
	WHITE_PLATE		= 4,/*白色*/
	BLACK_PLATE		= 8 /*黑色*/
}LPR_COLOR;

/*车牌层级*/
typedef enum enumPlateLayer
{
	SIG_LAYER		=	1,/*单层*/
	MUL_LAYER		=	2 /*多层*/
}LPR_LAYER;
/* 获取字段索引*/
typedef enum
{
	//身份证
	NAME                = 0,/* 姓名*/
	SEX                 = 1,/* 性别*/
	FOLK                = 2,/* 民族*/
	BIRTHDAY            = 3,/* 出生日期*/
	ADDRESS             = 4,/* 地址*/
	NUM                 = 5,/* 号码*/
	ISSUE               = 6,/* 签发机关*/
	PERIOD              = 7,/* 有效期限*/
	
	//行驶证
	DP_PLATENO			= 10,/* 号牌号码*/
	DP_TYPE				= 11,/* 车辆类型*/
	DP_OWNER			= 12,/* 所有人*/
	DP_ADDRESS			= 13,/* 住址*/
	DP_USECHARACTER		= 14,/* 使用性质*/
	DP_MODEL			= 15,/* 品牌号码*/
	DP_VIN				= 16,/* 车辆识别代号*/
	DP_ENGINENO			= 17,/* 发动机号码*/
	DP_REGISTER_DATE	= 18,/* 注册日期*/
	DP_ISSUE_DATE		= 19,/* 发证日期*/

	//驾驶证
	DL_NUM				= 20,/* 号码*/
	DL_NAME				= 21,/* 姓名*/
	DL_SEX				= 22,/* 性别*/
	DL_COUNTRY			= 23,/* 国籍*/
	DL_ADDRESS			= 24,/* 地址*/
	DL_BIRTHDAY			= 25,/* 出生日期*/
	DL_ISSUE_DATE		= 26,/*初次领证日期*/
	DL_CLASS			= 27,/*准驾车型*/
	DL_VALIDFROM		= 28,/*有效起始日期*/
	DL_VALIDFOR			= 29,/* 有效期限*/
	
	//火车票
	TIC_START			= 30,/* 起始站*/
	TIC_NUM				= 31,/* 车次*/
	TIC_END				= 32,/* 终点站*/
	TIC_TIME			= 33,/* 发车时间*/
	TIC_SEAT			= 34,/* 座位号*/
	TIC_NAME			= 35,/* 姓名*/

	/*银行卡字段*/
	TBANK_NUM			= 36,//获取银行卡号
	TBANK_NAME			= 37,//获取银行卡开户行
	TBANK_ORGCODE		= 38,//获取银行机构代码
	TBANK_CLASS			= 39,//获取卡种
	TBANK_CARD_NAME		= 40,//获取卡名
	TBANK_NUM_REGION	= 41,//获取银行卡号行区域
	TBANK_NUM_CHECKSTATUS	= 42,//获取银行卡号校验状态（该状态标记仅在非扫描识别模式下有效）
	TBANK_IMG_STREAM	= 43, // 银行卡号码区域图字节流
	TBANK_LENTH_IMGSTREAM	= 44, // 卡号区域图片字节流长度
	TMAX                = 45 /* 最大值*/ 
}TFIELDID;

/*回调函数定义*/
typedef int (*f_progress)(char *p);
/*回调函数*/
extern f_progress SendToMainMsg;

///////////////////////////////////////////////////////////////////////////////////////////
//银行卡识别结果导出结构
#define MAX_LENTH_CARDNUM		32
#define MAX_LENTH_VERSIONINFO	LENTH_VERSION_MAX
#define MAX_LENTH_BANKNAME		64
#define MAX_LENTH_CARDCLASS		16

//银行卡识别模式
typedef enum
{
	TBANK_MODE_SCAN		   = 0,//(默认模式)
	TBANK_MODE_OTHER	   = 1,
}TBANK_REC_MODE;

//银行卡卡号区域图片是否以JPG流的形式转出
typedef enum
{
	NONNEED_EXTRA_LINE_IMAGE_STREAM	=	0,
	NEED_EXTRA_LINE_IMAGE_STREAM	=	1,
}TBANK_EXPORT_STREAM;

//银行卡号识别结果是否满足LUTI校验模式(该校验模式仅在非扫描模式下有效)
typedef enum
{
	TBANK_STATUS_FAIL	  = 0,
	TBANK_STATUS_CHECK	  = 1,
}TBANK_CARDNUM_STATUS;

//获取银行卡相应栏目信息
typedef enum
{
	T_GET_BANK_NUM			= 0x01,//获取银行卡号
	T_GET_BANK_NAME			= 0x02,//获取银行卡开户行
	T_GET_BANK_ORGCODE		= 0x03,//获取银行机构代码
	T_GET_BANK_CLASS		= 0x04,//获取卡种
	T_GET_CARD_NAME			= 0x05,//获取卡名
	T_GET_NUM_REGION		= 0x06,//获取银行卡号行区域
	T_GET_NUM_CHECKSTATUS	= 0x07,//获取银行卡号校验状态（该状态标记仅在非扫描识别模式下有效）
	T_GET_IMAGE_STREAM		= 0x08,
	T_GET_LENTH_IMGSTREAM	= 0x09,
}TGETBANKINFOID;

#endif