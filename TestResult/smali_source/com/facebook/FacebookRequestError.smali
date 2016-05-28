.class public final Lcom/facebook/FacebookRequestError;
.super Ljava/lang/Object;
.source "FacebookRequestError.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/facebook/FacebookRequestError$Category;,
        Lcom/facebook/FacebookRequestError$Range;
    }
.end annotation


# static fields
.field private static final EC_RANGE_PERMISSION:Lcom/facebook/FacebookRequestError$Range;

.field private static final HTTP_RANGE_CLIENT_ERROR:Lcom/facebook/FacebookRequestError$Range;

.field private static final HTTP_RANGE_SERVER_ERROR:Lcom/facebook/FacebookRequestError$Range;

.field private static final HTTP_RANGE_SUCCESS:Lcom/facebook/FacebookRequestError$Range;


# instance fields
.field private final batchRequestResult:Ljava/lang/Object;

.field private final category:Lcom/facebook/FacebookRequestError$Category;

.field private final connection:Ljava/net/HttpURLConnection;

.field private final errorCode:I

.field private final errorIsTransient:Z

.field private final errorMessage:Ljava/lang/String;

.field private final errorType:Ljava/lang/String;

.field private final errorUserMessage:Ljava/lang/String;

.field private final errorUserTitle:Ljava/lang/String;

.field private final exception:Lcom/facebook/FacebookException;

.field private final requestResult:Lorg/json/JSONObject;

.field private final requestResultBody:Lorg/json/JSONObject;

.field private final requestStatusCode:I

.field private final shouldNotifyUser:Z

.field private final subErrorCode:I

.field private final userActionMessageId:I


# direct methods
.method static constructor <clinit>()V
    .registers 4

    .prologue
    const/16 v2, 0x12b

    const/16 v1, 0xc8

    const/4 v3, 0x0

    .line 86
    new-instance v0, Lcom/facebook/FacebookRequestError$Range;

    invoke-direct {v0, v1, v2, v3}, Lcom/facebook/FacebookRequestError$Range;-><init>(IILcom/facebook/FacebookRequestError$Range;)V

    sput-object v0, Lcom/facebook/FacebookRequestError;->EC_RANGE_PERMISSION:Lcom/facebook/FacebookRequestError$Range;

    .line 93
    new-instance v0, Lcom/facebook/FacebookRequestError$Range;

    invoke-direct {v0, v1, v2, v3}, Lcom/facebook/FacebookRequestError$Range;-><init>(IILcom/facebook/FacebookRequestError$Range;)V

    sput-object v0, Lcom/facebook/FacebookRequestError;->HTTP_RANGE_SUCCESS:Lcom/facebook/FacebookRequestError$Range;

    .line 94
    new-instance v0, Lcom/facebook/FacebookRequestError$Range;

    const/16 v1, 0x190

    const/16 v2, 0x1f3

    invoke-direct {v0, v1, v2, v3}, Lcom/facebook/FacebookRequestError$Range;-><init>(IILcom/facebook/FacebookRequestError$Range;)V

    sput-object v0, Lcom/facebook/FacebookRequestError;->HTTP_RANGE_CLIENT_ERROR:Lcom/facebook/FacebookRequestError$Range;

    .line 95
    new-instance v0, Lcom/facebook/FacebookRequestError$Range;

    const/16 v1, 0x1f4

    const/16 v2, 0x257

    invoke-direct {v0, v1, v2, v3}, Lcom/facebook/FacebookRequestError$Range;-><init>(IILcom/facebook/FacebookRequestError$Range;)V

    sput-object v0, Lcom/facebook/FacebookRequestError;->HTTP_RANGE_SERVER_ERROR:Lcom/facebook/FacebookRequestError$Range;

    return-void
.end method

.method private constructor <init>(IIILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLorg/json/JSONObject;Lorg/json/JSONObject;Ljava/lang/Object;Ljava/net/HttpURLConnection;)V
    .registers 27
    .param p1, "requestStatusCode"    # I
    .param p2, "errorCode"    # I
    .param p3, "subErrorCode"    # I
    .param p4, "errorType"    # Ljava/lang/String;
    .param p5, "errorMessage"    # Ljava/lang/String;
    .param p6, "errorUserTitle"    # Ljava/lang/String;
    .param p7, "errorUserMessage"    # Ljava/lang/String;
    .param p8, "errorIsTransient"    # Z
    .param p9, "requestResultBody"    # Lorg/json/JSONObject;
    .param p10, "requestResult"    # Lorg/json/JSONObject;
    .param p11, "batchRequestResult"    # Ljava/lang/Object;
    .param p12, "connection"    # Ljava/net/HttpURLConnection;

    .prologue
    .line 197
    .line 198
    const/4 v13, 0x0

    move-object v0, p0

    move v1, p1

    move/from16 v2, p2

    move/from16 v3, p3

    move-object/from16 v4, p4

    move-object/from16 v5, p5

    move-object/from16 v6, p6

    move-object/from16 v7, p7

    move/from16 v8, p8

    move-object/from16 v9, p9

    move-object/from16 v10, p10

    move-object/from16 v11, p11

    move-object/from16 v12, p12

    invoke-direct/range {v0 .. v13}, Lcom/facebook/FacebookRequestError;-><init>(IIILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLorg/json/JSONObject;Lorg/json/JSONObject;Ljava/lang/Object;Ljava/net/HttpURLConnection;Lcom/facebook/FacebookException;)V

    .line 199
    return-void
.end method

.method private constructor <init>(IIILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLorg/json/JSONObject;Lorg/json/JSONObject;Ljava/lang/Object;Ljava/net/HttpURLConnection;Lcom/facebook/FacebookException;)V
    .registers 20
    .param p1, "requestStatusCode"    # I
    .param p2, "errorCode"    # I
    .param p3, "subErrorCode"    # I
    .param p4, "errorType"    # Ljava/lang/String;
    .param p5, "errorMessage"    # Ljava/lang/String;
    .param p6, "errorUserTitle"    # Ljava/lang/String;
    .param p7, "errorUserMessage"    # Ljava/lang/String;
    .param p8, "errorIsTransient"    # Z
    .param p9, "requestResultBody"    # Lorg/json/JSONObject;
    .param p10, "requestResult"    # Lorg/json/JSONObject;
    .param p11, "batchRequestResult"    # Ljava/lang/Object;
    .param p12, "connection"    # Ljava/net/HttpURLConnection;
    .param p13, "exception"    # Lcom/facebook/FacebookException;

    .prologue
    .line 114
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 118
    iput p1, p0, Lcom/facebook/FacebookRequestError;->requestStatusCode:I

    .line 119
    iput p2, p0, Lcom/facebook/FacebookRequestError;->errorCode:I

    .line 120
    iput p3, p0, Lcom/facebook/FacebookRequestError;->subErrorCode:I

    .line 121
    iput-object p4, p0, Lcom/facebook/FacebookRequestError;->errorType:Ljava/lang/String;

    .line 122
    iput-object p5, p0, Lcom/facebook/FacebookRequestError;->errorMessage:Ljava/lang/String;

    .line 123
    iput-object p9, p0, Lcom/facebook/FacebookRequestError;->requestResultBody:Lorg/json/JSONObject;

    .line 124
    move-object/from16 v0, p10

    iput-object v0, p0, Lcom/facebook/FacebookRequestError;->requestResult:Lorg/json/JSONObject;

    .line 125
    move-object/from16 v0, p11

    iput-object v0, p0, Lcom/facebook/FacebookRequestError;->batchRequestResult:Ljava/lang/Object;

    .line 126
    move-object/from16 v0, p12

    iput-object v0, p0, Lcom/facebook/FacebookRequestError;->connection:Ljava/net/HttpURLConnection;

    .line 127
    iput-object p6, p0, Lcom/facebook/FacebookRequestError;->errorUserTitle:Ljava/lang/String;

    .line 128
    iput-object p7, p0, Lcom/facebook/FacebookRequestError;->errorUserMessage:Ljava/lang/String;

    .line 129
    iput-boolean p8, p0, Lcom/facebook/FacebookRequestError;->errorIsTransient:Z

    .line 131
    const/4 v2, 0x0

    .line 132
    .local v2, "isLocalException":Z
    if-eqz p13, :cond_41

    .line 133
    move-object/from16 v0, p13

    iput-object v0, p0, Lcom/facebook/FacebookRequestError;->exception:Lcom/facebook/FacebookException;

    .line 134
    const/4 v2, 0x1

    .line 141
    :goto_29
    const/4 v1, 0x0

    .line 142
    .local v1, "errorCategory":Lcom/facebook/FacebookRequestError$Category;
    const/4 v3, 0x0

    .line 143
    .local v3, "messageId":I
    const/4 v4, 0x0

    .line 144
    .local v4, "shouldNotify":Z
    if-eqz v2, :cond_49

    .line 145
    sget-object v1, Lcom/facebook/FacebookRequestError$Category;->CLIENT:Lcom/facebook/FacebookRequestError$Category;

    .line 146
    const/4 v3, 0x0

    .line 186
    :cond_31
    :goto_31
    if-eqz p7, :cond_b6

    invoke-virtual {p7}, Ljava/lang/String;->length()I

    move-result v5

    if-lez v5, :cond_b6

    const/4 v4, 0x1

    .line 188
    :goto_3a
    iput-object v1, p0, Lcom/facebook/FacebookRequestError;->category:Lcom/facebook/FacebookRequestError$Category;

    .line 189
    iput v3, p0, Lcom/facebook/FacebookRequestError;->userActionMessageId:I

    .line 190
    iput-boolean v4, p0, Lcom/facebook/FacebookRequestError;->shouldNotifyUser:Z

    .line 191
    return-void

    .line 136
    .end local v1    # "errorCategory":Lcom/facebook/FacebookRequestError$Category;
    .end local v3    # "messageId":I
    .end local v4    # "shouldNotify":Z
    :cond_41
    new-instance v5, Lcom/facebook/FacebookServiceException;

    invoke-direct {v5, p0, p5}, Lcom/facebook/FacebookServiceException;-><init>(Lcom/facebook/FacebookRequestError;Ljava/lang/String;)V

    iput-object v5, p0, Lcom/facebook/FacebookRequestError;->exception:Lcom/facebook/FacebookException;

    goto :goto_29

    .line 148
    .restart local v1    # "errorCategory":Lcom/facebook/FacebookRequestError$Category;
    .restart local v3    # "messageId":I
    .restart local v4    # "shouldNotify":Z
    :cond_49
    const/4 v5, 0x1

    if-eq p2, v5, :cond_4f

    const/4 v5, 0x2

    if-ne p2, v5, :cond_5e

    .line 149
    :cond_4f
    sget-object v1, Lcom/facebook/FacebookRequestError$Category;->SERVER:Lcom/facebook/FacebookRequestError$Category;

    .line 174
    :cond_51
    :goto_51
    if-nez v1, :cond_31

    .line 175
    sget-object v5, Lcom/facebook/FacebookRequestError;->HTTP_RANGE_CLIENT_ERROR:Lcom/facebook/FacebookRequestError$Range;

    invoke-virtual {v5, p1}, Lcom/facebook/FacebookRequestError$Range;->contains(I)Z

    move-result v5

    if-eqz v5, :cond_a7

    .line 176
    sget-object v1, Lcom/facebook/FacebookRequestError$Category;->BAD_REQUEST:Lcom/facebook/FacebookRequestError$Category;

    .line 177
    goto :goto_31

    .line 150
    :cond_5e
    const/4 v5, 0x4

    if-eq p2, v5, :cond_65

    const/16 v5, 0x11

    if-ne p2, v5, :cond_68

    .line 151
    :cond_65
    sget-object v1, Lcom/facebook/FacebookRequestError$Category;->THROTTLING:Lcom/facebook/FacebookRequestError$Category;

    .line 152
    goto :goto_51

    :cond_68
    const/16 v5, 0xa

    if-eq p2, v5, :cond_74

    sget-object v5, Lcom/facebook/FacebookRequestError;->EC_RANGE_PERMISSION:Lcom/facebook/FacebookRequestError$Range;

    invoke-virtual {v5, p2}, Lcom/facebook/FacebookRequestError$Range;->contains(I)Z

    move-result v5

    if-eqz v5, :cond_79

    .line 153
    :cond_74
    sget-object v1, Lcom/facebook/FacebookRequestError$Category;->PERMISSION:Lcom/facebook/FacebookRequestError$Category;

    .line 154
    sget v3, Lcom/behance/sdk/R$string;->com_facebook_requesterror_permissions:I

    .line 155
    goto :goto_51

    :cond_79
    const/16 v5, 0x66

    if-eq p2, v5, :cond_81

    const/16 v5, 0xbe

    if-ne p2, v5, :cond_51

    .line 156
    :cond_81
    const/16 v5, 0x1cb

    if-eq p3, v5, :cond_89

    const/16 v5, 0x1d0

    if-ne p3, v5, :cond_8f

    .line 157
    :cond_89
    sget-object v1, Lcom/facebook/FacebookRequestError$Category;->AUTHENTICATION_RETRY:Lcom/facebook/FacebookRequestError$Category;

    .line 158
    sget v3, Lcom/behance/sdk/R$string;->com_facebook_requesterror_web_login:I

    .line 159
    const/4 v4, 0x1

    .line 160
    goto :goto_51

    .line 161
    :cond_8f
    sget-object v1, Lcom/facebook/FacebookRequestError$Category;->AUTHENTICATION_REOPEN_SESSION:Lcom/facebook/FacebookRequestError$Category;

    .line 163
    const/16 v5, 0x1ca

    if-eq p3, v5, :cond_99

    const/16 v5, 0x1cf

    if-ne p3, v5, :cond_9c

    .line 164
    :cond_99
    sget v3, Lcom/behance/sdk/R$string;->com_facebook_requesterror_relogin:I

    .line 165
    goto :goto_51

    :cond_9c
    const/16 v5, 0x1cc

    if-ne p3, v5, :cond_a3

    .line 166
    sget v3, Lcom/behance/sdk/R$string;->com_facebook_requesterror_password_changed:I

    .line 167
    goto :goto_51

    .line 168
    :cond_a3
    sget v3, Lcom/behance/sdk/R$string;->com_facebook_requesterror_reconnect:I

    .line 169
    const/4 v4, 0x1

    goto :goto_51

    .line 177
    :cond_a7
    sget-object v5, Lcom/facebook/FacebookRequestError;->HTTP_RANGE_SERVER_ERROR:Lcom/facebook/FacebookRequestError$Range;

    invoke-virtual {v5, p1}, Lcom/facebook/FacebookRequestError$Range;->contains(I)Z

    move-result v5

    if-eqz v5, :cond_b2

    .line 178
    sget-object v1, Lcom/facebook/FacebookRequestError$Category;->SERVER:Lcom/facebook/FacebookRequestError$Category;

    .line 179
    goto :goto_31

    .line 180
    :cond_b2
    sget-object v1, Lcom/facebook/FacebookRequestError$Category;->OTHER:Lcom/facebook/FacebookRequestError$Category;

    goto/16 :goto_31

    .line 186
    :cond_b6
    const/4 v4, 0x0

    goto :goto_3a
.end method

.method public constructor <init>(ILjava/lang/String;Ljava/lang/String;)V
    .registers 18
    .param p1, "errorCode"    # I
    .param p2, "errorType"    # Ljava/lang/String;
    .param p3, "errorMessage"    # Ljava/lang/String;

    .prologue
    .line 209
    const/4 v1, -0x1

    const/4 v3, -0x1

    .line 210
    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/4 v13, 0x0

    move-object v0, p0

    move v2, p1

    move-object/from16 v4, p2

    move-object/from16 v5, p3

    invoke-direct/range {v0 .. v13}, Lcom/facebook/FacebookRequestError;-><init>(IIILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLorg/json/JSONObject;Lorg/json/JSONObject;Ljava/lang/Object;Ljava/net/HttpURLConnection;Lcom/facebook/FacebookException;)V

    .line 211
    return-void
.end method

.method constructor <init>(Ljava/net/HttpURLConnection;Ljava/lang/Exception;)V
    .registers 18
    .param p1, "connection"    # Ljava/net/HttpURLConnection;
    .param p2, "exception"    # Ljava/lang/Exception;

    .prologue
    .line 202
    const/4 v2, -0x1

    const/4 v3, -0x1

    const/4 v4, -0x1

    .line 203
    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    .line 204
    move-object/from16 v0, p2

    instance-of v1, v0, Lcom/facebook/FacebookException;

    if-eqz v1, :cond_1c

    .line 205
    check-cast p2, Lcom/facebook/FacebookException;

    .end local p2    # "exception":Ljava/lang/Exception;
    move-object/from16 v14, p2

    :goto_15
    move-object v1, p0

    move-object/from16 v13, p1

    invoke-direct/range {v1 .. v14}, Lcom/facebook/FacebookRequestError;-><init>(IIILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLorg/json/JSONObject;Lorg/json/JSONObject;Ljava/lang/Object;Ljava/net/HttpURLConnection;Lcom/facebook/FacebookException;)V

    .line 206
    return-void

    .line 205
    .restart local p2    # "exception":Ljava/lang/Exception;
    :cond_1c
    new-instance v14, Lcom/facebook/FacebookException;

    move-object/from16 v0, p2

    invoke-direct {v14, v0}, Lcom/facebook/FacebookException;-><init>(Ljava/lang/Throwable;)V

    goto :goto_15
.end method

.method static checkResponseAndCreateError(Lorg/json/JSONObject;Ljava/lang/Object;Ljava/net/HttpURLConnection;)Lcom/facebook/FacebookRequestError;
    .registers 30
    .param p0, "singleResult"    # Lorg/json/JSONObject;
    .param p1, "batchResult"    # Ljava/lang/Object;
    .param p2, "connection"    # Ljava/net/HttpURLConnection;

    .prologue
    .line 395
    :try_start_0
    const-string v1, "code"

    move-object/from16 v0, p0

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_106

    .line 396
    const-string v1, "code"

    move-object/from16 v0, p0

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v2

    .line 397
    .local v2, "responseCode":I
    const-string v1, "body"

    .line 398
    const-string v11, "FACEBOOK_NON_JSON_RESULT"

    .line 397
    move-object/from16 v0, p0

    invoke-static {v0, v1, v11}, Lcom/facebook/internal/Utility;->getStringPropertyAsJSON(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v24

    .line 400
    .local v24, "body":Ljava/lang/Object;
    if-eqz v24, :cond_c9

    move-object/from16 v0, v24

    instance-of v1, v0, Lorg/json/JSONObject;

    if-eqz v1, :cond_c9

    .line 401
    move-object/from16 v0, v24

    check-cast v0, Lorg/json/JSONObject;

    move-object v10, v0

    .line 404
    .local v10, "jsonBody":Lorg/json/JSONObject;
    const/4 v5, 0x0

    .line 405
    .local v5, "errorType":Ljava/lang/String;
    const/4 v6, 0x0

    .line 406
    .local v6, "errorMessage":Ljava/lang/String;
    const/4 v8, 0x0

    .line 407
    .local v8, "errorUserMessage":Ljava/lang/String;
    const/4 v7, 0x0

    .line 408
    .local v7, "errorUserTitle":Ljava/lang/String;
    const/4 v9, 0x0

    .line 409
    .local v9, "errorIsTransient":Z
    const/4 v3, -0x1

    .line 410
    .local v3, "errorCode":I
    const/4 v4, -0x1

    .line 412
    .local v4, "errorSubCode":I
    const/16 v26, 0x0

    .line 413
    .local v26, "hasError":Z
    const-string v1, "error"

    invoke-virtual {v10, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_92

    .line 415
    const-string v1, "error"

    const/4 v11, 0x0

    invoke-static {v10, v1, v11}, Lcom/facebook/internal/Utility;->getStringPropertyAsJSON(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v25

    check-cast v25, Lorg/json/JSONObject;

    .line 417
    .local v25, "error":Lorg/json/JSONObject;
    const-string v1, "type"

    const/4 v11, 0x0

    move-object/from16 v0, v25

    invoke-virtual {v0, v1, v11}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 418
    const-string v1, "message"

    const/4 v11, 0x0

    move-object/from16 v0, v25

    invoke-virtual {v0, v1, v11}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 419
    const-string v1, "code"

    const/4 v11, -0x1

    move-object/from16 v0, v25

    invoke-virtual {v0, v1, v11}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v3

    .line 420
    const-string v1, "error_subcode"

    const/4 v11, -0x1

    move-object/from16 v0, v25

    invoke-virtual {v0, v1, v11}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v4

    .line 421
    const-string v1, "error_user_msg"

    const/4 v11, 0x0

    move-object/from16 v0, v25

    invoke-virtual {v0, v1, v11}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 422
    const-string v1, "error_user_title"

    const/4 v11, 0x0

    move-object/from16 v0, v25

    invoke-virtual {v0, v1, v11}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 423
    const-string v1, "is_transient"

    const/4 v11, 0x0

    move-object/from16 v0, v25

    invoke-virtual {v0, v1, v11}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v9

    .line 424
    const/16 v26, 0x1

    .line 434
    .end local v25    # "error":Lorg/json/JSONObject;
    :cond_84
    :goto_84
    if-eqz v26, :cond_c9

    .line 435
    new-instance v1, Lcom/facebook/FacebookRequestError;

    move-object/from16 v11, p0

    move-object/from16 v12, p1

    move-object/from16 v13, p2

    invoke-direct/range {v1 .. v13}, Lcom/facebook/FacebookRequestError;-><init>(IIILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLorg/json/JSONObject;Lorg/json/JSONObject;Ljava/lang/Object;Ljava/net/HttpURLConnection;)V

    .line 454
    .end local v2    # "responseCode":I
    .end local v3    # "errorCode":I
    .end local v4    # "errorSubCode":I
    .end local v5    # "errorType":Ljava/lang/String;
    .end local v6    # "errorMessage":Ljava/lang/String;
    .end local v7    # "errorUserTitle":Ljava/lang/String;
    .end local v8    # "errorUserMessage":Ljava/lang/String;
    .end local v9    # "errorIsTransient":Z
    .end local v10    # "jsonBody":Lorg/json/JSONObject;
    .end local v24    # "body":Ljava/lang/Object;
    .end local v26    # "hasError":Z
    :goto_91
    return-object v1

    .line 425
    .restart local v2    # "responseCode":I
    .restart local v3    # "errorCode":I
    .restart local v4    # "errorSubCode":I
    .restart local v5    # "errorType":Ljava/lang/String;
    .restart local v6    # "errorMessage":Ljava/lang/String;
    .restart local v7    # "errorUserTitle":Ljava/lang/String;
    .restart local v8    # "errorUserMessage":Ljava/lang/String;
    .restart local v9    # "errorIsTransient":Z
    .restart local v10    # "jsonBody":Lorg/json/JSONObject;
    .restart local v24    # "body":Ljava/lang/Object;
    .restart local v26    # "hasError":Z
    :cond_92
    const-string v1, "error_code"

    invoke-virtual {v10, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_aa

    const-string v1, "error_msg"

    invoke-virtual {v10, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_aa

    .line 426
    const-string v1, "error_reason"

    invoke-virtual {v10, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_84

    .line 427
    :cond_aa
    const-string v1, "error_reason"

    const/4 v11, 0x0

    invoke-virtual {v10, v1, v11}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 428
    const-string v1, "error_msg"

    const/4 v11, 0x0

    invoke-virtual {v10, v1, v11}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 429
    const-string v1, "error_code"

    const/4 v11, -0x1

    invoke-virtual {v10, v1, v11}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v3

    .line 430
    const-string v1, "error_subcode"

    const/4 v11, -0x1

    invoke-virtual {v10, v1, v11}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v4

    .line 431
    const/16 v26, 0x1

    goto :goto_84

    .line 442
    .end local v3    # "errorCode":I
    .end local v4    # "errorSubCode":I
    .end local v5    # "errorType":Ljava/lang/String;
    .end local v6    # "errorMessage":Ljava/lang/String;
    .end local v7    # "errorUserTitle":Ljava/lang/String;
    .end local v8    # "errorUserMessage":Ljava/lang/String;
    .end local v9    # "errorIsTransient":Z
    .end local v10    # "jsonBody":Lorg/json/JSONObject;
    .end local v26    # "hasError":Z
    :cond_c9
    sget-object v1, Lcom/facebook/FacebookRequestError;->HTTP_RANGE_SUCCESS:Lcom/facebook/FacebookRequestError$Range;

    invoke-virtual {v1, v2}, Lcom/facebook/FacebookRequestError$Range;->contains(I)Z

    move-result v1

    if-nez v1, :cond_106

    .line 443
    new-instance v11, Lcom/facebook/FacebookRequestError;

    const/4 v13, -0x1

    .line 444
    const/4 v14, -0x1

    const/4 v15, 0x0

    const/16 v16, 0x0

    const/16 v17, 0x0

    const/16 v18, 0x0

    const/16 v19, 0x0

    .line 445
    const-string v1, "body"

    move-object/from16 v0, p0

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_102

    .line 447
    const-string v1, "body"

    const-string v12, "FACEBOOK_NON_JSON_RESULT"

    .line 446
    move-object/from16 v0, p0

    invoke-static {v0, v1, v12}, Lcom/facebook/internal/Utility;->getStringPropertyAsJSON(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/json/JSONObject;

    move-object/from16 v20, v1

    :goto_f6
    move v12, v2

    move-object/from16 v21, p0

    move-object/from16 v22, p1

    move-object/from16 v23, p2

    .line 443
    invoke-direct/range {v11 .. v23}, Lcom/facebook/FacebookRequestError;-><init>(IIILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLorg/json/JSONObject;Lorg/json/JSONObject;Ljava/lang/Object;Ljava/net/HttpURLConnection;)V
    :try_end_100
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_100} :catch_105

    move-object v1, v11

    goto :goto_91

    .line 447
    :cond_102
    const/16 v20, 0x0

    goto :goto_f6

    .line 451
    .end local v2    # "responseCode":I
    .end local v24    # "body":Ljava/lang/Object;
    :catch_105
    move-exception v1

    .line 454
    :cond_106
    const/4 v1, 0x0

    goto :goto_91
.end method


# virtual methods
.method public getErrorCode()I
    .registers 2

    .prologue
    .line 260
    iget v0, p0, Lcom/facebook/FacebookRequestError;->errorCode:I

    return v0
.end method

.method public getErrorMessage()Ljava/lang/String;
    .registers 2

    .prologue
    .line 289
    iget-object v0, p0, Lcom/facebook/FacebookRequestError;->errorMessage:Ljava/lang/String;

    if-eqz v0, :cond_7

    .line 290
    iget-object v0, p0, Lcom/facebook/FacebookRequestError;->errorMessage:Ljava/lang/String;

    .line 292
    :goto_6
    return-object v0

    :cond_7
    iget-object v0, p0, Lcom/facebook/FacebookRequestError;->exception:Lcom/facebook/FacebookException;

    invoke-virtual {v0}, Lcom/facebook/FacebookException;->getLocalizedMessage()Ljava/lang/String;

    move-result-object v0

    goto :goto_6
.end method

.method public getErrorType()Ljava/lang/String;
    .registers 2

    .prologue
    .line 280
    iget-object v0, p0, Lcom/facebook/FacebookRequestError;->errorType:Ljava/lang/String;

    return-object v0
.end method

.method public getErrorUserMessage()Ljava/lang/String;
    .registers 2

    .prologue
    .line 304
    iget-object v0, p0, Lcom/facebook/FacebookRequestError;->errorUserMessage:Ljava/lang/String;

    return-object v0
.end method

.method public getRequestStatusCode()I
    .registers 2

    .prologue
    .line 251
    iget v0, p0, Lcom/facebook/FacebookRequestError;->requestStatusCode:I

    return v0
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 380
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "{HttpStatus: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 381
    iget v1, p0, Lcom/facebook/FacebookRequestError;->requestStatusCode:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 382
    const-string v1, ", errorCode: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 383
    iget v1, p0, Lcom/facebook/FacebookRequestError;->errorCode:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 384
    const-string v1, ", errorType: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 385
    iget-object v1, p0, Lcom/facebook/FacebookRequestError;->errorType:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 386
    const-string v1, ", errorMessage: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 387
    invoke-virtual {p0}, Lcom/facebook/FacebookRequestError;->getErrorMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 388
    const-string v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 389
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 380
    return-object v0
.end method
