.class public Lcom/behance/sdk/asynctasks/BehanceSDKEditProfileAsyncTask;
.super Landroid/os/AsyncTask;
.source "BehanceSDKEditProfileAsyncTask.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Lcom/behance/sdk/asynctask/params/BehanceSDKEditProfileAsyncTaskParams;",
        "Ljava/lang/Void;",
        "Lcom/behance/sdk/asynctasks/result/BehanceSDKEditProfileTaskResult;",
        ">;"
    }
.end annotation


# static fields
.field private static final logger:Lcom/behance/sdk/logger/ILogger;


# instance fields
.field private taskHandler:Lcom/behance/sdk/asynctask/listeners/IBehanceSDKEditProfileAsyncTaskListener;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 42
    const-class v0, Lcom/behance/sdk/asynctasks/BehanceSDKEditProfileAsyncTask;

    invoke-static {v0}, Lcom/behance/sdk/logger/LoggerFactory;->getLogger(Ljava/lang/Class;)Lcom/behance/sdk/logger/ILogger;

    move-result-object v0

    sput-object v0, Lcom/behance/sdk/asynctasks/BehanceSDKEditProfileAsyncTask;->logger:Lcom/behance/sdk/logger/ILogger;

    return-void
.end method

.method public constructor <init>(Lcom/behance/sdk/asynctask/listeners/IBehanceSDKEditProfileAsyncTaskListener;)V
    .registers 2
    .param p1, "taskHandler"    # Lcom/behance/sdk/asynctask/listeners/IBehanceSDKEditProfileAsyncTaskListener;

    .prologue
    .line 46
    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 47
    iput-object p1, p0, Lcom/behance/sdk/asynctasks/BehanceSDKEditProfileAsyncTask;->taskHandler:Lcom/behance/sdk/asynctask/listeners/IBehanceSDKEditProfileAsyncTaskListener;

    .line 48
    return-void
.end method


# virtual methods
.method protected varargs doInBackground([Lcom/behance/sdk/asynctask/params/BehanceSDKEditProfileAsyncTaskParams;)Lcom/behance/sdk/asynctasks/result/BehanceSDKEditProfileTaskResult;
    .registers 43
    .param p1, "params"    # [Lcom/behance/sdk/asynctask/params/BehanceSDKEditProfileAsyncTaskParams;

    .prologue
    .line 52
    new-instance v28, Lcom/behance/sdk/asynctasks/result/BehanceSDKEditProfileTaskResult;

    invoke-direct/range {v28 .. v28}, Lcom/behance/sdk/asynctasks/result/BehanceSDKEditProfileTaskResult;-><init>()V

    .line 54
    .local v28, "result":Lcom/behance/sdk/asynctasks/result/BehanceSDKEditProfileTaskResult;
    const/16 v36, 0x0

    aget-object v12, p1, v36

    .line 58
    .local v12, "editProfileAsyncTaskParams":Lcom/behance/sdk/asynctask/params/BehanceSDKEditProfileAsyncTaskParams;
    :try_start_9
    new-instance v10, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v10}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>()V

    .line 59
    .local v10, "defaultHttpClient":Lorg/apache/http/impl/client/DefaultHttpClient;
    new-instance v33, Ljava/util/HashMap;

    invoke-direct/range {v33 .. v33}, Ljava/util/HashMap;-><init>()V

    .line 60
    .local v33, "urlParams":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v36, "clientId"

    invoke-virtual {v12}, Lcom/behance/sdk/asynctask/params/BehanceSDKEditProfileAsyncTaskParams;->getClientId()Ljava/lang/String;

    move-result-object v37

    move-object/from16 v0, v33

    move-object/from16 v1, v36

    move-object/from16 v2, v37

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 61
    const-string v36, "{server_root_url}/v2/profile/editor?{key_client_id_param}={clientId}"

    move-object/from16 v0, v36

    move-object/from16 v1, v33

    invoke-static {v0, v1}, Lcom/behance/sdk/util/BehanceSDKUrlUtil;->getUrlFromTemplate(Ljava/lang/String;Ljava/util/Map;)Ljava/lang/String;

    move-result-object v32

    .line 63
    .local v32, "url":Ljava/lang/String;
    new-instance v17, Ljava/util/ArrayList;

    invoke-direct/range {v17 .. v17}, Ljava/util/ArrayList;-><init>()V

    .line 64
    .local v17, "httpPostParams":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lorg/apache/http/NameValuePair;>;"
    new-instance v36, Lorg/apache/http/message/BasicNameValuePair;

    const-string v37, "token_type"

    const-string v38, "device_token"

    invoke-direct/range {v36 .. v38}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    move-object/from16 v0, v17

    move-object/from16 v1, v36

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 65
    invoke-static {}, Lcom/behance/sdk/managers/BehanceSDKUserManager;->getInstance()Lcom/behance/sdk/managers/BehanceSDKUserManager;

    move-result-object v29

    .line 66
    .local v29, "sdkUserManager":Lcom/behance/sdk/managers/BehanceSDKUserManager;
    invoke-virtual/range {v29 .. v29}, Lcom/behance/sdk/managers/BehanceSDKUserManager;->checkExpiryAndGetAccessToken()Ljava/lang/String;

    move-result-object v34

    .line 67
    .local v34, "userAccessToken":Ljava/lang/String;
    if-eqz v34, :cond_57

    .line 68
    const-string v36, "access_token"

    move-object/from16 v0, v32

    move-object/from16 v1, v36

    move-object/from16 v2, v34

    invoke-static {v0, v1, v2}, Lcom/behance/sdk/util/BehanceSDKUrlUtil;->appendQueryStringParam(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v32

    .line 70
    :cond_57
    invoke-virtual {v12}, Lcom/behance/sdk/asynctask/params/BehanceSDKEditProfileAsyncTaskParams;->getFirstName()Ljava/lang/String;

    move-result-object v14

    .line 71
    .local v14, "firstName":Ljava/lang/String;
    invoke-static {v14}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v36

    if-nez v36, :cond_73

    .line 72
    new-instance v36, Lorg/apache/http/message/BasicNameValuePair;

    const-string v37, "first_name"

    move-object/from16 v0, v36

    move-object/from16 v1, v37

    invoke-direct {v0, v1, v14}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    move-object/from16 v0, v17

    move-object/from16 v1, v36

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 74
    :cond_73
    invoke-virtual {v12}, Lcom/behance/sdk/asynctask/params/BehanceSDKEditProfileAsyncTaskParams;->getLastName()Ljava/lang/String;

    move-result-object v23

    .line 75
    .local v23, "lastName":Ljava/lang/String;
    invoke-static/range {v23 .. v23}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v36

    if-nez v36, :cond_91

    .line 76
    new-instance v36, Lorg/apache/http/message/BasicNameValuePair;

    const-string v37, "last_name"

    move-object/from16 v0, v36

    move-object/from16 v1, v37

    move-object/from16 v2, v23

    invoke-direct {v0, v1, v2}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    move-object/from16 v0, v17

    move-object/from16 v1, v36

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 78
    :cond_91
    invoke-virtual {v12}, Lcom/behance/sdk/asynctask/params/BehanceSDKEditProfileAsyncTaskParams;->getOccupation()Ljava/lang/String;

    move-result-object v24

    .line 79
    .local v24, "occupation":Ljava/lang/String;
    if-eqz v24, :cond_ab

    .line 80
    new-instance v36, Lorg/apache/http/message/BasicNameValuePair;

    const-string v37, "occupation"

    move-object/from16 v0, v36

    move-object/from16 v1, v37

    move-object/from16 v2, v24

    invoke-direct {v0, v1, v2}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    move-object/from16 v0, v17

    move-object/from16 v1, v36

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 82
    :cond_ab
    invoke-virtual {v12}, Lcom/behance/sdk/asynctask/params/BehanceSDKEditProfileAsyncTaskParams;->getCompany()Ljava/lang/String;

    move-result-object v5

    .line 83
    .local v5, "company":Ljava/lang/String;
    if-eqz v5, :cond_c3

    .line 84
    new-instance v36, Lorg/apache/http/message/BasicNameValuePair;

    const-string v37, "company"

    move-object/from16 v0, v36

    move-object/from16 v1, v37

    invoke-direct {v0, v1, v5}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    move-object/from16 v0, v17

    move-object/from16 v1, v36

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 86
    :cond_c3
    invoke-virtual {v12}, Lcom/behance/sdk/asynctask/params/BehanceSDKEditProfileAsyncTaskParams;->getWebsite()Ljava/lang/String;

    move-result-object v35

    .line 87
    .local v35, "website":Ljava/lang/String;
    if-eqz v35, :cond_dd

    .line 88
    new-instance v36, Lorg/apache/http/message/BasicNameValuePair;

    const-string v37, "website"

    move-object/from16 v0, v36

    move-object/from16 v1, v37

    move-object/from16 v2, v35

    invoke-direct {v0, v1, v2}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    move-object/from16 v0, v17

    move-object/from16 v1, v36

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 90
    :cond_dd
    invoke-virtual {v12}, Lcom/behance/sdk/asynctask/params/BehanceSDKEditProfileAsyncTaskParams;->getCountry()Ljava/lang/String;

    move-result-object v6

    .line 91
    .local v6, "country":Ljava/lang/String;
    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v36

    if-nez v36, :cond_f9

    .line 92
    new-instance v36, Lorg/apache/http/message/BasicNameValuePair;

    const-string v37, "country"

    move-object/from16 v0, v36

    move-object/from16 v1, v37

    invoke-direct {v0, v1, v6}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    move-object/from16 v0, v17

    move-object/from16 v1, v36

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 94
    :cond_f9
    invoke-virtual {v12}, Lcom/behance/sdk/asynctask/params/BehanceSDKEditProfileAsyncTaskParams;->getState()Ljava/lang/String;

    move-result-object v30

    .line 95
    .local v30, "state":Ljava/lang/String;
    invoke-static/range {v30 .. v30}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v36

    if-nez v36, :cond_117

    .line 96
    new-instance v36, Lorg/apache/http/message/BasicNameValuePair;

    const-string v37, "state"

    move-object/from16 v0, v36

    move-object/from16 v1, v37

    move-object/from16 v2, v30

    invoke-direct {v0, v1, v2}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    move-object/from16 v0, v17

    move-object/from16 v1, v36

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 98
    :cond_117
    invoke-virtual {v12}, Lcom/behance/sdk/asynctask/params/BehanceSDKEditProfileAsyncTaskParams;->getCity()Ljava/lang/String;

    move-result-object v4

    .line 99
    .local v4, "city":Ljava/lang/String;
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v36

    if-nez v36, :cond_133

    .line 100
    new-instance v36, Lorg/apache/http/message/BasicNameValuePair;

    const-string v37, "city"

    move-object/from16 v0, v36

    move-object/from16 v1, v37

    invoke-direct {v0, v1, v4}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    move-object/from16 v0, v17

    move-object/from16 v1, v36

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 102
    :cond_133
    new-instance v13, Lorg/apache/http/client/entity/UrlEncodedFormEntity;

    const-string v36, "UTF-8"

    move-object/from16 v0, v17

    move-object/from16 v1, v36

    invoke-direct {v13, v0, v1}, Lorg/apache/http/client/entity/UrlEncodedFormEntity;-><init>(Ljava/util/List;Ljava/lang/String;)V

    .line 104
    .local v13, "entity":Lorg/apache/http/HttpEntity;
    new-instance v16, Lorg/apache/http/client/methods/HttpPost;

    move-object/from16 v0, v16

    move-object/from16 v1, v32

    invoke-direct {v0, v1}, Lorg/apache/http/client/methods/HttpPost;-><init>(Ljava/lang/String;)V

    .line 105
    .local v16, "httpPost":Lorg/apache/http/client/methods/HttpPost;
    move-object/from16 v0, v16

    invoke-virtual {v0, v13}, Lorg/apache/http/client/methods/HttpPost;->setEntity(Lorg/apache/http/HttpEntity;)V

    .line 106
    move-object/from16 v0, v16

    invoke-virtual {v10, v0}, Lorg/apache/http/impl/client/DefaultHttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;

    move-result-object v18

    .line 108
    .local v18, "httpResponse":Lorg/apache/http/HttpResponse;
    invoke-interface/range {v18 .. v18}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v36

    invoke-static/range {v36 .. v36}, Lorg/apache/http/util/EntityUtils;->toString(Lorg/apache/http/HttpEntity;)Ljava/lang/String;

    move-result-object v22

    .line 109
    .local v22, "jsonResponseString":Ljava/lang/String;
    sget-object v36, Lcom/behance/sdk/asynctasks/BehanceSDKEditProfileAsyncTask;->logger:Lcom/behance/sdk/logger/ILogger;

    const-string v37, "Update Profile server response - %s"

    const/16 v38, 0x1

    move/from16 v0, v38

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v38, v0

    const/16 v39, 0x0

    aput-object v22, v38, v39

    invoke-interface/range {v36 .. v38}, Lcom/behance/sdk/logger/ILogger;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 110
    new-instance v21, Lorg/json/JSONObject;

    invoke-direct/range {v21 .. v22}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 112
    .local v21, "jsonObject":Lorg/json/JSONObject;
    const-string v36, "http_code"

    move-object/from16 v0, v21

    move-object/from16 v1, v36

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v19

    .line 113
    .local v19, "httpResponseCode":I
    const-string v36, "updated"

    move-object/from16 v0, v21

    move-object/from16 v1, v36

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v31

    .line 114
    .local v31, "updatedVerification":I
    sget-object v36, Lcom/behance/sdk/asynctasks/BehanceSDKEditProfileAsyncTask;->logger:Lcom/behance/sdk/logger/ILogger;

    const-string v37, "Update Profile [HTTP Response code - %s] [Updated - %s]"

    const/16 v38, 0x2

    move/from16 v0, v38

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v38, v0

    const/16 v39, 0x0

    invoke-static/range {v19 .. v19}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v40

    aput-object v40, v38, v39

    const/16 v39, 0x1

    invoke-static/range {v31 .. v31}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v40

    aput-object v40, v38, v39

    invoke-interface/range {v36 .. v38}, Lcom/behance/sdk/logger/ILogger;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 116
    const/16 v36, 0xc8

    move/from16 v0, v19

    move/from16 v1, v36

    if-ne v0, v1, :cond_214

    .line 117
    const/16 v36, 0x1

    move/from16 v0, v31

    move/from16 v1, v36

    if-ne v0, v1, :cond_1be

    .line 118
    const/16 v36, 0x0

    move-object/from16 v0, v28

    move/from16 v1, v36

    invoke-virtual {v0, v1}, Lcom/behance/sdk/asynctasks/result/BehanceSDKEditProfileTaskResult;->setProfileUpdateFailed(Z)V

    .line 126
    :cond_1be
    :goto_1be
    new-instance v15, Lorg/apache/http/client/methods/HttpPatch;

    move-object/from16 v0, v32

    invoke-direct {v15, v0}, Lorg/apache/http/client/methods/HttpPatch;-><init>(Ljava/lang/String;)V

    .line 128
    .local v15, "httpPatch":Lorg/apache/http/client/methods/HttpPatch;
    invoke-virtual {v12}, Lcom/behance/sdk/asynctask/params/BehanceSDKEditProfileAsyncTaskParams;->getProfileImageBitmap()Landroid/graphics/Bitmap;

    move-result-object v25

    .line 129
    .local v25, "profileImageBitmap":Landroid/graphics/Bitmap;
    invoke-virtual {v12}, Lcom/behance/sdk/asynctask/params/BehanceSDKEditProfileAsyncTaskParams;->getImage()Lcom/behance/sdk/project/modules/ImageModule;

    move-result-object v26

    .line 130
    .local v26, "profileImageModule":Lcom/behance/sdk/project/modules/ImageModule;
    if-eqz v25, :cond_2bc

    if-eqz v26, :cond_2bc

    .line 131
    new-instance v3, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v3}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 132
    .local v3, "baos":Ljava/io/ByteArrayOutputStream;
    sget-object v36, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;

    const/16 v37, 0x64

    move-object/from16 v0, v25

    move-object/from16 v1, v36

    move/from16 v2, v37

    invoke-virtual {v0, v1, v2, v3}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    .line 133
    invoke-virtual {v3}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v20

    .line 134
    .local v20, "imageBytes":[B
    invoke-static {}, Lorg/apache/http/entity/mime/MultipartEntityBuilder;->create()Lorg/apache/http/entity/mime/MultipartEntityBuilder;

    move-result-object v9

    .line 135
    .local v9, "create":Lorg/apache/http/entity/mime/MultipartEntityBuilder;
    new-instance v7, Ljava/io/ByteArrayInputStream;

    move-object/from16 v0, v20

    invoke-direct {v7, v0}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .line 136
    .local v7, "coverImageInputStream":Ljava/io/ByteArrayInputStream;
    new-instance v8, Lorg/apache/http/entity/mime/content/InputStreamBody;

    invoke-virtual/range {v26 .. v26}, Lcom/behance/sdk/project/modules/ImageModule;->getName()Ljava/lang/String;

    move-result-object v36

    move-object/from16 v0, v36

    invoke-direct {v8, v7, v0}, Lorg/apache/http/entity/mime/content/InputStreamBody;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    .line 137
    .local v8, "coverImageStreamBody":Lorg/apache/http/entity/mime/content/InputStreamBody;
    const-string v36, "image"

    move-object/from16 v0, v36

    invoke-virtual {v9, v0, v8}, Lorg/apache/http/entity/mime/MultipartEntityBuilder;->addPart(Ljava/lang/String;Lorg/apache/http/entity/mime/content/ContentBody;)Lorg/apache/http/entity/mime/MultipartEntityBuilder;

    .line 138
    invoke-virtual {v9}, Lorg/apache/http/entity/mime/MultipartEntityBuilder;->build()Lorg/apache/http/HttpEntity;

    move-result-object v13

    .line 139
    invoke-virtual {v15, v13}, Lorg/apache/http/client/methods/HttpPatch;->setEntity(Lorg/apache/http/HttpEntity;)V

    .line 140
    invoke-virtual/range {p0 .. p0}, Lcom/behance/sdk/asynctasks/BehanceSDKEditProfileAsyncTask;->isCancelled()Z

    move-result v36

    if-eqz v36, :cond_25a

    .line 141
    const/16 v28, 0x0

    .line 167
    .end local v3    # "baos":Ljava/io/ByteArrayOutputStream;
    .end local v4    # "city":Ljava/lang/String;
    .end local v5    # "company":Ljava/lang/String;
    .end local v6    # "country":Ljava/lang/String;
    .end local v7    # "coverImageInputStream":Ljava/io/ByteArrayInputStream;
    .end local v8    # "coverImageStreamBody":Lorg/apache/http/entity/mime/content/InputStreamBody;
    .end local v9    # "create":Lorg/apache/http/entity/mime/MultipartEntityBuilder;
    .end local v10    # "defaultHttpClient":Lorg/apache/http/impl/client/DefaultHttpClient;
    .end local v13    # "entity":Lorg/apache/http/HttpEntity;
    .end local v14    # "firstName":Ljava/lang/String;
    .end local v15    # "httpPatch":Lorg/apache/http/client/methods/HttpPatch;
    .end local v16    # "httpPost":Lorg/apache/http/client/methods/HttpPost;
    .end local v17    # "httpPostParams":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lorg/apache/http/NameValuePair;>;"
    .end local v18    # "httpResponse":Lorg/apache/http/HttpResponse;
    .end local v19    # "httpResponseCode":I
    .end local v20    # "imageBytes":[B
    .end local v21    # "jsonObject":Lorg/json/JSONObject;
    .end local v22    # "jsonResponseString":Ljava/lang/String;
    .end local v23    # "lastName":Ljava/lang/String;
    .end local v24    # "occupation":Ljava/lang/String;
    .end local v25    # "profileImageBitmap":Landroid/graphics/Bitmap;
    .end local v26    # "profileImageModule":Lcom/behance/sdk/project/modules/ImageModule;
    .end local v28    # "result":Lcom/behance/sdk/asynctasks/result/BehanceSDKEditProfileTaskResult;
    .end local v29    # "sdkUserManager":Lcom/behance/sdk/managers/BehanceSDKUserManager;
    .end local v30    # "state":Ljava/lang/String;
    .end local v31    # "updatedVerification":I
    .end local v32    # "url":Ljava/lang/String;
    .end local v33    # "urlParams":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v34    # "userAccessToken":Ljava/lang/String;
    .end local v35    # "website":Ljava/lang/String;
    :cond_213
    :goto_213
    return-object v28

    .line 121
    .restart local v4    # "city":Ljava/lang/String;
    .restart local v5    # "company":Ljava/lang/String;
    .restart local v6    # "country":Ljava/lang/String;
    .restart local v10    # "defaultHttpClient":Lorg/apache/http/impl/client/DefaultHttpClient;
    .restart local v13    # "entity":Lorg/apache/http/HttpEntity;
    .restart local v14    # "firstName":Ljava/lang/String;
    .restart local v16    # "httpPost":Lorg/apache/http/client/methods/HttpPost;
    .restart local v17    # "httpPostParams":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lorg/apache/http/NameValuePair;>;"
    .restart local v18    # "httpResponse":Lorg/apache/http/HttpResponse;
    .restart local v19    # "httpResponseCode":I
    .restart local v21    # "jsonObject":Lorg/json/JSONObject;
    .restart local v22    # "jsonResponseString":Ljava/lang/String;
    .restart local v23    # "lastName":Ljava/lang/String;
    .restart local v24    # "occupation":Ljava/lang/String;
    .restart local v28    # "result":Lcom/behance/sdk/asynctasks/result/BehanceSDKEditProfileTaskResult;
    .restart local v29    # "sdkUserManager":Lcom/behance/sdk/managers/BehanceSDKUserManager;
    .restart local v30    # "state":Ljava/lang/String;
    .restart local v31    # "updatedVerification":I
    .restart local v32    # "url":Ljava/lang/String;
    .restart local v33    # "urlParams":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .restart local v34    # "userAccessToken":Ljava/lang/String;
    .restart local v35    # "website":Ljava/lang/String;
    :cond_214
    const/16 v36, 0x1

    move-object/from16 v0, v28

    move/from16 v1, v36

    invoke-virtual {v0, v1}, Lcom/behance/sdk/asynctasks/result/BehanceSDKEditProfileTaskResult;->setExceptionOccurred(Z)V

    .line 122
    const/16 v36, 0x1

    move-object/from16 v0, v28

    move/from16 v1, v36

    invoke-virtual {v0, v1}, Lcom/behance/sdk/asynctasks/result/BehanceSDKEditProfileTaskResult;->setProfileUpdateFailed(Z)V

    .line 123
    new-instance v36, Ljava/lang/Exception;

    const-string v37, "Invalid server response saving user profile"

    invoke-direct/range {v36 .. v37}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v28

    move-object/from16 v1, v36

    invoke-virtual {v0, v1}, Lcom/behance/sdk/asynctasks/result/BehanceSDKEditProfileTaskResult;->addException(Ljava/lang/Exception;)V
    :try_end_234
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_234} :catch_235

    goto :goto_1be

    .line 161
    .end local v4    # "city":Ljava/lang/String;
    .end local v5    # "company":Ljava/lang/String;
    .end local v6    # "country":Ljava/lang/String;
    .end local v10    # "defaultHttpClient":Lorg/apache/http/impl/client/DefaultHttpClient;
    .end local v13    # "entity":Lorg/apache/http/HttpEntity;
    .end local v14    # "firstName":Ljava/lang/String;
    .end local v16    # "httpPost":Lorg/apache/http/client/methods/HttpPost;
    .end local v17    # "httpPostParams":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lorg/apache/http/NameValuePair;>;"
    .end local v18    # "httpResponse":Lorg/apache/http/HttpResponse;
    .end local v19    # "httpResponseCode":I
    .end local v21    # "jsonObject":Lorg/json/JSONObject;
    .end local v22    # "jsonResponseString":Ljava/lang/String;
    .end local v23    # "lastName":Ljava/lang/String;
    .end local v24    # "occupation":Ljava/lang/String;
    .end local v29    # "sdkUserManager":Lcom/behance/sdk/managers/BehanceSDKUserManager;
    .end local v30    # "state":Ljava/lang/String;
    .end local v31    # "updatedVerification":I
    .end local v32    # "url":Ljava/lang/String;
    .end local v33    # "urlParams":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v34    # "userAccessToken":Ljava/lang/String;
    .end local v35    # "website":Ljava/lang/String;
    :catch_235
    move-exception v11

    .line 162
    .local v11, "e":Ljava/lang/Exception;
    sget-object v36, Lcom/behance/sdk/asynctasks/BehanceSDKEditProfileAsyncTask;->logger:Lcom/behance/sdk/logger/ILogger;

    const-string v37, "Unknown problem saving user profile"

    const/16 v38, 0x0

    move/from16 v0, v38

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v38, v0

    move-object/from16 v0, v36

    move-object/from16 v1, v37

    move-object/from16 v2, v38

    invoke-interface {v0, v11, v1, v2}, Lcom/behance/sdk/logger/ILogger;->error(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 163
    const/16 v36, 0x1

    move-object/from16 v0, v28

    move/from16 v1, v36

    invoke-virtual {v0, v1}, Lcom/behance/sdk/asynctasks/result/BehanceSDKEditProfileTaskResult;->setExceptionOccurred(Z)V

    .line 164
    move-object/from16 v0, v28

    invoke-virtual {v0, v11}, Lcom/behance/sdk/asynctasks/result/BehanceSDKEditProfileTaskResult;->addException(Ljava/lang/Exception;)V

    goto :goto_213

    .line 143
    .end local v11    # "e":Ljava/lang/Exception;
    .restart local v3    # "baos":Ljava/io/ByteArrayOutputStream;
    .restart local v4    # "city":Ljava/lang/String;
    .restart local v5    # "company":Ljava/lang/String;
    .restart local v6    # "country":Ljava/lang/String;
    .restart local v7    # "coverImageInputStream":Ljava/io/ByteArrayInputStream;
    .restart local v8    # "coverImageStreamBody":Lorg/apache/http/entity/mime/content/InputStreamBody;
    .restart local v9    # "create":Lorg/apache/http/entity/mime/MultipartEntityBuilder;
    .restart local v10    # "defaultHttpClient":Lorg/apache/http/impl/client/DefaultHttpClient;
    .restart local v13    # "entity":Lorg/apache/http/HttpEntity;
    .restart local v14    # "firstName":Ljava/lang/String;
    .restart local v15    # "httpPatch":Lorg/apache/http/client/methods/HttpPatch;
    .restart local v16    # "httpPost":Lorg/apache/http/client/methods/HttpPost;
    .restart local v17    # "httpPostParams":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lorg/apache/http/NameValuePair;>;"
    .restart local v18    # "httpResponse":Lorg/apache/http/HttpResponse;
    .restart local v19    # "httpResponseCode":I
    .restart local v20    # "imageBytes":[B
    .restart local v21    # "jsonObject":Lorg/json/JSONObject;
    .restart local v22    # "jsonResponseString":Ljava/lang/String;
    .restart local v23    # "lastName":Ljava/lang/String;
    .restart local v24    # "occupation":Ljava/lang/String;
    .restart local v25    # "profileImageBitmap":Landroid/graphics/Bitmap;
    .restart local v26    # "profileImageModule":Lcom/behance/sdk/project/modules/ImageModule;
    .restart local v29    # "sdkUserManager":Lcom/behance/sdk/managers/BehanceSDKUserManager;
    .restart local v30    # "state":Ljava/lang/String;
    .restart local v31    # "updatedVerification":I
    .restart local v32    # "url":Ljava/lang/String;
    .restart local v33    # "urlParams":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .restart local v34    # "userAccessToken":Ljava/lang/String;
    .restart local v35    # "website":Ljava/lang/String;
    :cond_25a
    :try_start_25a
    invoke-virtual {v10, v15}, Lorg/apache/http/impl/client/DefaultHttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;

    move-result-object v27

    .line 144
    .local v27, "response":Lorg/apache/http/HttpResponse;
    invoke-interface/range {v27 .. v27}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v36

    invoke-static/range {v36 .. v36}, Lorg/apache/http/util/EntityUtils;->toString(Lorg/apache/http/HttpEntity;)Ljava/lang/String;

    move-result-object v22

    .line 145
    new-instance v21, Lorg/json/JSONObject;

    .end local v21    # "jsonObject":Lorg/json/JSONObject;
    invoke-direct/range {v21 .. v22}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 146
    .restart local v21    # "jsonObject":Lorg/json/JSONObject;
    const-string v36, "http_code"

    move-object/from16 v0, v21

    move-object/from16 v1, v36

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v19

    .line 147
    const-string v36, "updated"

    move-object/from16 v0, v21

    move-object/from16 v1, v36

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v31

    .line 148
    const/16 v36, 0xc8

    move/from16 v0, v19

    move/from16 v1, v36

    if-ne v0, v1, :cond_29a

    .line 149
    const/16 v36, 0x1

    move/from16 v0, v31

    move/from16 v1, v36

    if-ne v0, v1, :cond_213

    .line 150
    const/16 v36, 0x0

    move-object/from16 v0, v28

    move/from16 v1, v36

    invoke-virtual {v0, v1}, Lcom/behance/sdk/asynctasks/result/BehanceSDKEditProfileTaskResult;->setProfileAvatarUpdateFailed(Z)V

    goto/16 :goto_213

    .line 153
    :cond_29a
    const/16 v36, 0x1

    move-object/from16 v0, v28

    move/from16 v1, v36

    invoke-virtual {v0, v1}, Lcom/behance/sdk/asynctasks/result/BehanceSDKEditProfileTaskResult;->setProfileAvatarUpdateFailed(Z)V

    .line 154
    const/16 v36, 0x1

    move-object/from16 v0, v28

    move/from16 v1, v36

    invoke-virtual {v0, v1}, Lcom/behance/sdk/asynctasks/result/BehanceSDKEditProfileTaskResult;->setExceptionOccurred(Z)V

    .line 155
    new-instance v36, Ljava/lang/Exception;

    const-string v37, "Invalid server response saving user profile avatar"

    invoke-direct/range {v36 .. v37}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v28

    move-object/from16 v1, v36

    invoke-virtual {v0, v1}, Lcom/behance/sdk/asynctasks/result/BehanceSDKEditProfileTaskResult;->addException(Ljava/lang/Exception;)V

    goto/16 :goto_213

    .line 158
    .end local v3    # "baos":Ljava/io/ByteArrayOutputStream;
    .end local v7    # "coverImageInputStream":Ljava/io/ByteArrayInputStream;
    .end local v8    # "coverImageStreamBody":Lorg/apache/http/entity/mime/content/InputStreamBody;
    .end local v9    # "create":Lorg/apache/http/entity/mime/MultipartEntityBuilder;
    .end local v20    # "imageBytes":[B
    .end local v27    # "response":Lorg/apache/http/HttpResponse;
    :cond_2bc
    const/16 v36, 0x0

    move-object/from16 v0, v28

    move/from16 v1, v36

    invoke-virtual {v0, v1}, Lcom/behance/sdk/asynctasks/result/BehanceSDKEditProfileTaskResult;->setProfileAvatarUpdateFailed(Z)V
    :try_end_2c5
    .catch Ljava/lang/Exception; {:try_start_25a .. :try_end_2c5} :catch_235

    goto/16 :goto_213
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    .prologue
    .line 40
    check-cast p1, [Lcom/behance/sdk/asynctask/params/BehanceSDKEditProfileAsyncTaskParams;

    invoke-virtual {p0, p1}, Lcom/behance/sdk/asynctasks/BehanceSDKEditProfileAsyncTask;->doInBackground([Lcom/behance/sdk/asynctask/params/BehanceSDKEditProfileAsyncTaskParams;)Lcom/behance/sdk/asynctasks/result/BehanceSDKEditProfileTaskResult;

    move-result-object v0

    return-object v0
.end method

.method protected onPostExecute(Lcom/behance/sdk/asynctasks/result/BehanceSDKEditProfileTaskResult;)V
    .registers 3
    .param p1, "result"    # Lcom/behance/sdk/asynctasks/result/BehanceSDKEditProfileTaskResult;

    .prologue
    .line 172
    invoke-virtual {p1}, Lcom/behance/sdk/asynctasks/result/BehanceSDKEditProfileTaskResult;->isExceptionOccurred()Z

    move-result v0

    if-eqz v0, :cond_c

    .line 173
    iget-object v0, p0, Lcom/behance/sdk/asynctasks/BehanceSDKEditProfileAsyncTask;->taskHandler:Lcom/behance/sdk/asynctask/listeners/IBehanceSDKEditProfileAsyncTaskListener;

    invoke-interface {v0, p1}, Lcom/behance/sdk/asynctask/listeners/IBehanceSDKEditProfileAsyncTaskListener;->onEditProfileTaskFailure(Lcom/behance/sdk/asynctasks/result/BehanceSDKEditProfileTaskResult;)V

    .line 176
    :goto_b
    return-void

    .line 175
    :cond_c
    iget-object v0, p0, Lcom/behance/sdk/asynctasks/BehanceSDKEditProfileAsyncTask;->taskHandler:Lcom/behance/sdk/asynctask/listeners/IBehanceSDKEditProfileAsyncTaskListener;

    invoke-interface {v0, p1}, Lcom/behance/sdk/asynctask/listeners/IBehanceSDKEditProfileAsyncTaskListener;->onEditProfileTaskSuccess(Lcom/behance/sdk/asynctasks/result/BehanceSDKEditProfileTaskResult;)V

    goto :goto_b
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .registers 2

    .prologue
    .line 40
    check-cast p1, Lcom/behance/sdk/asynctasks/result/BehanceSDKEditProfileTaskResult;

    invoke-virtual {p0, p1}, Lcom/behance/sdk/asynctasks/BehanceSDKEditProfileAsyncTask;->onPostExecute(Lcom/behance/sdk/asynctasks/result/BehanceSDKEditProfileTaskResult;)V

    return-void
.end method
