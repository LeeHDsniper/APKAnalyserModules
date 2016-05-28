.class public Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;
.super Ljava/lang/Object;
.source "AdobeCloud.java"

# interfaces
.implements Ljava/io/Externalizable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud$1;
    }
.end annotation


# instance fields
.field private _GUID:Ljava/lang/String;

.field private _available:Z

.field private _cloudDescription:Ljava/lang/String;

.field private _eTag:Ljava/lang/String;

.field private _endpoints:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceType;",
            "Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudEndpoint;",
            ">;"
        }
    .end annotation
.end field

.field private _logoURL:Ljava/net/URL;

.field private _name:Ljava/lang/String;

.field private _parameters:Lorg/json/JSONObject;

.field private _privateCloud:Z

.field private _quotaEnabled:Z

.field private _region:Ljava/lang/String;

.field private _sessions:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceType;",
            "Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession;",
            ">;"
        }
    .end annotation
.end field

.field private _version:J


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 264
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 265
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;->_endpoints:Ljava/util/HashMap;

    .line 266
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;->_sessions:Ljava/util/HashMap;

    .line 267
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;->_parameters:Lorg/json/JSONObject;

    .line 268
    return-void
.end method

.method private setServiceType(Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceType;Ljava/lang/String;Ljava/lang/String;)V
    .registers 9
    .param p1, "type"    # Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceType;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "uri"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudException;
        }
    .end annotation

    .prologue
    .line 684
    if-eqz p3, :cond_1d

    sget-object v2, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceType;->AdobeCloudServiceTypeUnknown:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceType;

    if-eq p1, v2, :cond_1d

    .line 686
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;->_endpoints:Ljava/util/HashMap;

    invoke-virtual {v2, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudEndpoint;

    .line 688
    .local v1, "endpoint":Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudEndpoint;
    if-eqz v1, :cond_29

    .line 691
    :try_start_10
    new-instance v2, Ljava/net/URL;

    invoke-direct {v2, p3}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p2, v2}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudEndpoint;->addServiceSchemaId(Ljava/lang/String;Ljava/net/URL;)V
    :try_end_18
    .catch Ljava/net/MalformedURLException; {:try_start_10 .. :try_end_18} :catch_1e

    .line 704
    :goto_18
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;->_endpoints:Ljava/util/HashMap;

    invoke-virtual {v2, p1, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 706
    .end local v1    # "endpoint":Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudEndpoint;
    :cond_1d
    return-void

    .line 692
    .restart local v1    # "endpoint":Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudEndpoint;
    :catch_1e
    move-exception v0

    .line 693
    .local v0, "e":Ljava/net/MalformedURLException;
    new-instance v2, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudException;

    sget-object v3, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudErrorCode;->AdobeCloudErrorUnexpectedResponse:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudErrorCode;

    const-string v4, "Parsing of input failed"

    invoke-direct {v2, v3, v4, v0}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudException;-><init>(Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudErrorCode;Ljava/lang/String;Ljava/lang/Exception;)V

    throw v2

    .line 699
    .end local v0    # "e":Ljava/net/MalformedURLException;
    :cond_29
    :try_start_29
    new-instance v1, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudEndpoint;

    .end local v1    # "endpoint":Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudEndpoint;
    new-instance v2, Ljava/net/URL;

    invoke-direct {v2, p3}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-direct {v1, p2, v2, p1}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudEndpoint;-><init>(Ljava/lang/String;Ljava/net/URL;Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceType;)V
    :try_end_33
    .catch Ljava/net/MalformedURLException; {:try_start_29 .. :try_end_33} :catch_34

    .restart local v1    # "endpoint":Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudEndpoint;
    goto :goto_18

    .line 700
    .end local v1    # "endpoint":Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudEndpoint;
    :catch_34
    move-exception v0

    .line 701
    .restart local v0    # "e":Ljava/net/MalformedURLException;
    new-instance v2, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudException;

    sget-object v3, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudErrorCode;->AdobeCloudErrorUnexpectedResponse:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudErrorCode;

    const-string v4, "Parsing of input failed"

    invoke-direct {v2, v3, v4, v0}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudException;-><init>(Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudErrorCode;Ljava/lang/String;Ljava/lang/Exception;)V

    throw v2
.end method

.method private uriForKey(Ljava/util/ArrayList;Lorg/json/JSONObject;)Ljava/lang/String;
    .registers 9
    .param p2, "features"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Lorg/json/JSONObject;",
            ")",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 662
    .local p1, "nestedKey":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    const/4 v2, 0x0

    .line 664
    .local v2, "result":Ljava/lang/String;
    move-object v3, p2

    .line 665
    .local v3, "values":Lorg/json/JSONObject;
    const/4 v0, 0x1

    .line 667
    .local v0, "foundValue":Z
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_7
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1f

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 668
    .local v1, "key":Ljava/lang/String;
    invoke-virtual {v3, v1}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v5

    if-eqz v5, :cond_1e

    .line 669
    invoke-virtual {v3, v1}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    goto :goto_7

    .line 671
    :cond_1e
    const/4 v0, 0x0

    .line 676
    .end local v1    # "key":Ljava/lang/String;
    :cond_1f
    if-eqz v0, :cond_28

    .line 677
    const-string v4, "uri"

    const/4 v5, 0x0

    invoke-virtual {v3, v4, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 680
    :cond_28
    return-object v2
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 6
    .param p1, "object"    # Ljava/lang/Object;

    .prologue
    .line 296
    const/4 v1, 0x0

    .line 298
    .local v1, "result":Z
    if-eqz p1, :cond_16

    instance-of v2, p1, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    if-eqz v2, :cond_16

    move-object v0, p1

    .line 300
    check-cast v0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    .line 301
    .local v0, "cloud":Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;
    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;->_GUID:Ljava/lang/String;

    if-eqz v2, :cond_17

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;->_GUID:Ljava/lang/String;

    iget-object v3, v0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;->_GUID:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    .line 304
    .end local v0    # "cloud":Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;
    :cond_16
    :goto_16
    return v1

    .line 301
    .restart local v0    # "cloud":Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;
    :cond_17
    iget-object v2, v0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;->_GUID:Ljava/lang/String;

    if-nez v2, :cond_1d

    const/4 v1, 0x1

    goto :goto_16

    :cond_1d
    const/4 v1, 0x0

    goto :goto_16
.end method

.method protected getEndpoints()Ljava/util/HashMap;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/HashMap",
            "<",
            "Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceType;",
            "Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudEndpoint;",
            ">;"
        }
    .end annotation

    .prologue
    .line 181
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;->_endpoints:Ljava/util/HashMap;

    return-object v0
.end method

.method protected getEtag()Ljava/lang/String;
    .registers 2

    .prologue
    .line 124
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;->_eTag:Ljava/lang/String;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 108
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;->_name:Ljava/lang/String;

    return-object v0
.end method

.method public getSessionForService(Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceType;)Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession;
    .registers 8
    .param p1, "serviceType"    # Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceType;

    .prologue
    .line 363
    const/4 v1, 0x0

    .line 366
    .local v1, "result":Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession;
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;->_sessions:Ljava/util/HashMap;

    invoke-virtual {v3, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_12

    .line 368
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;->_sessions:Ljava/util/HashMap;

    invoke-virtual {v3, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .end local v1    # "result":Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession;
    check-cast v1, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession;

    .line 427
    .restart local v1    # "result":Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession;
    :cond_11
    :goto_11
    return-object v1

    .line 374
    :cond_12
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;->_endpoints:Ljava/util/HashMap;

    invoke-virtual {v3, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudEndpoint;

    .line 378
    .local v0, "endpoint":Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudEndpoint;
    if-eqz v0, :cond_23

    .line 379
    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudEndpoint;->getServiceType()Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceType;

    move-result-object v3

    if-eq v3, p1, :cond_23

    .line 381
    const/4 v0, 0x0

    .line 384
    :cond_23
    const/4 v2, 0x0

    .line 387
    .local v2, "session":Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession;
    sget-object v3, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud$1;->$SwitchMap$com$adobe$creativesdk$foundation$adobeinternal$cloud$AdobeCloudServiceType:[I

    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceType;->ordinal()I

    move-result v4

    aget v3, v3, v4

    packed-switch v3, :pswitch_data_68

    .line 415
    sget-object v3, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->ERROR:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-class v4, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    invoke-virtual {v4}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v4

    const-string v5, "Invalid cloud type specified."

    invoke-static {v3, v4, v5}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;)V

    .line 419
    :goto_3c
    if-eqz v2, :cond_11

    .line 421
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;->isPrivateCloud()Z

    move-result v3

    invoke-virtual {v2, v3}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession;->setPrivateService(Z)V

    .line 422
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;->_sessions:Ljava/util/HashMap;

    invoke-virtual {v3, p1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 423
    move-object v1, v2

    goto :goto_11

    .line 390
    :pswitch_4c
    invoke-static {v0}, Lcom/adobe/creativesdk/foundation/adobeinternal/imageservice/AdobeImageSession;->getSessionForCloudEndpoint(Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudEndpoint;)Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession;

    move-result-object v2

    .line 391
    goto :goto_3c

    .line 394
    :pswitch_51
    const/4 v2, 0x0

    .line 395
    goto :goto_3c

    .line 398
    :pswitch_53
    invoke-static {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;->getSessionForCloudEndpoint(Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudEndpoint;)Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession;

    move-result-object v2

    .line 399
    goto :goto_3c

    .line 402
    :pswitch_58
    invoke-static {v0}, Lcom/adobe/creativesdk/foundation/internal/storage/model/services/AdobeStorageSession;->getSessionForCloudEndpoint(Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudEndpoint;)Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession;

    move-result-object v2

    .line 403
    goto :goto_3c

    .line 406
    :pswitch_5d
    invoke-static {v0}, Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession;->getSessionForCloudEndpoint(Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudEndpoint;)Lcom/adobe/creativesdk/foundation/adobeinternal/entitlement/AdobeEntitlementSession;

    move-result-object v2

    .line 407
    goto :goto_3c

    .line 410
    :pswitch_62
    invoke-static {v0}, Lcom/adobe/creativesdk/foundation/internal/sendtodesktop/AdobeNotificationSession;->getSessionForCloudEndpoint(Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudEndpoint;)Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession;

    move-result-object v2

    .line 411
    goto :goto_3c

    .line 387
    nop

    :pswitch_data_68
    .packed-switch 0x1
        :pswitch_4c
        :pswitch_51
        :pswitch_53
        :pswitch_58
        :pswitch_5d
        :pswitch_62
    .end packed-switch
.end method

.method public isAvailable()Z
    .registers 2

    .prologue
    .line 231
    iget-boolean v0, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;->_available:Z

    return v0
.end method

.method public isPrivateCloud()Z
    .registers 2

    .prologue
    .line 245
    iget-boolean v0, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;->_privateCloud:Z

    return v0
.end method

.method public isQuotaEnabled()Z
    .registers 2

    .prologue
    .line 259
    iget-boolean v0, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;->_quotaEnabled:Z

    return v0
.end method

.method public isStrictlyEqual(Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;)Z
    .registers 5
    .param p1, "cloud"    # Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    .prologue
    .line 709
    invoke-virtual {p0, p1}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;->equals(Ljava/lang/Object;)Z

    move-result v0

    .line 711
    .local v0, "result":Z
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;->getEtag()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_1d

    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;->getEtag()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_1d

    .line 712
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;->getEtag()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;->getEtag()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    and-int/2addr v0, v1

    .line 714
    :cond_1d
    return v0
.end method

.method public readExternal(Ljava/io/ObjectInput;)V
    .registers 6
    .param p1, "objectInput"    # Ljava/io/ObjectInput;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .prologue
    .line 494
    invoke-interface {p1}, Ljava/io/ObjectInput;->readObject()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;->_GUID:Ljava/lang/String;

    .line 495
    invoke-interface {p1}, Ljava/io/ObjectInput;->readObject()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;->_eTag:Ljava/lang/String;

    .line 496
    invoke-interface {p1}, Ljava/io/ObjectInput;->readObject()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;->_name:Ljava/lang/String;

    .line 497
    invoke-interface {p1}, Ljava/io/ObjectInput;->readObject()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;->_cloudDescription:Ljava/lang/String;

    .line 498
    invoke-interface {p1}, Ljava/io/ObjectInput;->readObject()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;->_region:Ljava/lang/String;

    .line 499
    invoke-interface {p1}, Ljava/io/ObjectInput;->readObject()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/net/URL;

    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;->_logoURL:Ljava/net/URL;

    .line 500
    invoke-interface {p1}, Ljava/io/ObjectInput;->readObject()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/HashMap;

    iput-object v1, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;->_endpoints:Ljava/util/HashMap;

    .line 502
    :try_start_38
    new-instance v2, Lorg/json/JSONObject;

    invoke-interface {p1}, Ljava/io/ObjectInput;->readObject()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-direct {v2, v1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    iput-object v2, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;->_parameters:Lorg/json/JSONObject;
    :try_end_45
    .catch Lorg/json/JSONException; {:try_start_38 .. :try_end_45} :catch_5e

    .line 506
    :goto_45
    invoke-interface {p1}, Ljava/io/ObjectInput;->readLong()J

    move-result-wide v2

    iput-wide v2, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;->_version:J

    .line 507
    invoke-interface {p1}, Ljava/io/ObjectInput;->readBoolean()Z

    move-result v1

    iput-boolean v1, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;->_available:Z

    .line 508
    invoke-interface {p1}, Ljava/io/ObjectInput;->readBoolean()Z

    move-result v1

    iput-boolean v1, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;->_privateCloud:Z

    .line 509
    invoke-interface {p1}, Ljava/io/ObjectInput;->readBoolean()Z

    move-result v1

    iput-boolean v1, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;->_quotaEnabled:Z

    .line 510
    return-void

    .line 503
    :catch_5e
    move-exception v0

    .line 504
    .local v0, "e":Lorg/json/JSONException;
    sget-object v1, Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;->DEBUG:Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;

    const-class v2, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    invoke-virtual {v2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    invoke-static {v1, v2, v3, v0}, Lcom/adobe/creativesdk/foundation/internal/utils/logging/AdobeLogger;->log(Lcom/adobe/creativesdk/foundation/internal/utils/logging/Level;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_45
.end method

.method public removeAllServices()V
    .registers 5

    .prologue
    .line 457
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;->_sessions:Ljava/util/HashMap;

    if-eqz v3, :cond_36

    .line 458
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;->_sessions:Ljava/util/HashMap;

    invoke-virtual {v3}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v1

    .line 460
    .local v1, "entrySet":Ljava/util/Set;, "Ljava/util/Set<Ljava/util/Map$Entry<Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceType;Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession;>;>;"
    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/util/Map$Entry<Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceType;Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession;>;>;"
    :goto_e
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_31

    .line 461
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 462
    .local v0, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceType;Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession;>;"
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession;

    invoke-virtual {v3}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession;->tearDownService()V

    .line 463
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession;

    invoke-virtual {v3}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession;->getHttpServices()Ljava/util/HashMap;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/HashMap;->clear()V

    goto :goto_e

    .line 465
    .end local v0    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceType;Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession;>;"
    :cond_31
    iget-object v3, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;->_sessions:Ljava/util/HashMap;

    invoke-virtual {v3}, Ljava/util/HashMap;->clear()V

    .line 467
    .end local v1    # "entrySet":Ljava/util/Set;, "Ljava/util/Set<Ljava/util/Map$Entry<Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceType;Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession;>;>;"
    .end local v2    # "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/util/Map$Entry<Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceType;Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession;>;>;"
    :cond_36
    return-void
.end method

.method protected setAvailable(Z)V
    .registers 2
    .param p1, "available"    # Z

    .prologue
    .line 224
    iput-boolean p1, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;->_available:Z

    .line 225
    return-void
.end method

.method public setGUID(Ljava/lang/String;)V
    .registers 2
    .param p1, "GUID"    # Ljava/lang/String;

    .prologue
    .line 84
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;->_GUID:Ljava/lang/String;

    .line 85
    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .registers 2
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 100
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;->_name:Ljava/lang/String;

    .line 101
    return-void
.end method

.method public setPrivateCloud(Z)V
    .registers 2
    .param p1, "privateCloud"    # Z

    .prologue
    .line 238
    iput-boolean p1, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;->_privateCloud:Z

    .line 239
    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 5

    .prologue
    .line 309
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 311
    .local v0, "dict":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;->_GUID:Ljava/lang/String;

    if-eqz v1, :cond_10

    .line 313
    const-string v1, "guid"

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;->_GUID:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 316
    :cond_10
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;->_eTag:Ljava/lang/String;

    if-eqz v1, :cond_1b

    .line 318
    const-string v1, "etag"

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;->_eTag:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 321
    :cond_1b
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;->_name:Ljava/lang/String;

    if-eqz v1, :cond_26

    .line 323
    const-string v1, "name"

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;->_name:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 326
    :cond_26
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;->_cloudDescription:Ljava/lang/String;

    if-eqz v1, :cond_31

    .line 328
    const-string v1, "cloudDescription"

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;->_cloudDescription:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 331
    :cond_31
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;->_region:Ljava/lang/String;

    if-eqz v1, :cond_3c

    .line 333
    const-string v1, "region"

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;->_region:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 336
    :cond_3c
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;->_endpoints:Ljava/util/HashMap;

    if-eqz v1, :cond_47

    .line 338
    const-string v1, "endpoints"

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;->_endpoints:Ljava/util/HashMap;

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 341
    :cond_47
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;->_parameters:Lorg/json/JSONObject;

    if-eqz v1, :cond_52

    .line 343
    const-string v1, "parameters"

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;->_parameters:Lorg/json/JSONObject;

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 346
    :cond_52
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;->_sessions:Ljava/util/HashMap;

    if-eqz v1, :cond_5d

    .line 348
    const-string v1, "sessions"

    iget-object v2, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;->_sessions:Ljava/util/HashMap;

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 351
    :cond_5d
    const-string v1, "version"

    iget-wide v2, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;->_version:J

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 352
    const-string v1, "availability"

    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;->isAvailable()Z

    move-result v2

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 353
    const-string v1, "private"

    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;->isPrivateCloud()Z

    move-result v2

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 354
    const-string v1, "quotaEnabled"

    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;->isQuotaEnabled()Z

    move-result v2

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 356
    invoke-virtual {v0}, Ljava/util/HashMap;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public updateFromDictionary(Lorg/json/JSONObject;)Z
    .registers 16
    .param p1, "data"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudException;
        }
    .end annotation

    .prologue
    const/4 v10, 0x1

    const/4 v9, 0x0

    const/4 v13, 0x0

    .line 551
    if-nez p1, :cond_6

    .line 657
    :goto_5
    return v9

    .line 554
    :cond_6
    const-string v8, "id"

    invoke-virtual {p1, v8, v13}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    iput-object v8, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;->_GUID:Ljava/lang/String;

    .line 555
    const-string v8, "etag"

    invoke-virtual {p1, v8, v13}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    iput-object v8, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;->_eTag:Ljava/lang/String;

    .line 556
    const-string v8, "name"

    invoke-virtual {p1, v8, v13}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    iput-object v8, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;->_name:Ljava/lang/String;

    .line 557
    const-string v8, "cloudDescription"

    invoke-virtual {p1, v8, v13}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    iput-object v8, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;->_cloudDescription:Ljava/lang/String;

    .line 558
    const-string v8, "region"

    invoke-virtual {p1, v8, v13}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    iput-object v8, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;->_region:Ljava/lang/String;

    .line 560
    const-string v8, "iconUrl"

    invoke-virtual {p1, v8}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v8

    if-eqz v8, :cond_144

    const-string v8, "iconUrl"

    invoke-virtual {p1, v8}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v8

    instance-of v8, v8, Ljava/net/URL;

    if-eqz v8, :cond_144

    .line 561
    const-string v8, "iconUrl"

    invoke-virtual {p1, v8}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/net/URL;

    iput-object v8, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;->_logoURL:Ljava/net/URL;

    .line 575
    :cond_4a
    :goto_4a
    const-string v8, "status"

    invoke-virtual {p1, v8, v13}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 576
    .local v5, "status":Ljava/lang/String;
    if-eqz v5, :cond_16b

    const-string v8, "Provisioned"

    invoke-virtual {v5, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_62

    const-string v8, "online"

    invoke-virtual {v5, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_168

    :cond_62
    move v8, v10

    :goto_63
    iput-boolean v8, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;->_available:Z

    .line 577
    const-string v8, "private"

    invoke-virtual {p1, v8, v9}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v8

    iput-boolean v8, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;->_privateCloud:Z

    .line 579
    iput-boolean v10, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;->_quotaEnabled:Z

    .line 580
    const-string v8, "parameters"

    invoke-virtual {p1, v8}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v4

    .line 581
    .local v4, "parameters":Lorg/json/JSONObject;
    if-eqz v4, :cond_8d

    .line 583
    invoke-static {v4}, Lcom/adobe/creativesdk/foundation/internal/storage/model/util/AdobeStorageCopyUtils;->deepMutableCopyOfDictionary(Lorg/json/JSONObject;)Lorg/json/JSONObject;

    move-result-object v8

    iput-object v8, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;->_parameters:Lorg/json/JSONObject;

    .line 584
    const-string v8, "quota"

    invoke-virtual {v4, v8}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_8d

    .line 585
    const-string v8, "quota"

    invoke-virtual {v4, v8}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    move-result v8

    iput-boolean v8, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;->_quotaEnabled:Z

    .line 588
    :cond_8d
    const-string v8, "features"

    invoke-virtual {p1, v8}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    .line 590
    .local v1, "features":Lorg/json/JSONObject;
    const/4 v6, 0x0

    .line 592
    .local v6, "uri":Ljava/lang/String;
    const/4 v2, 0x1

    .line 594
    .local v2, "hasAccessToStorageServices":Z
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;->isPrivateCloud()Z

    move-result v8

    if-eqz v8, :cond_16e

    .line 596
    invoke-static {}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices;->getSharedServices()Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices;

    move-result-object v8

    invoke-virtual {v8}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices;->hasAccessToPrivateStorageServices()Z

    move-result v2

    .line 603
    :goto_a3
    if-eqz v2, :cond_178

    .line 605
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 606
    .local v3, "keys":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    const-string v8, "files"

    invoke-virtual {v3, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 607
    const-string v8, "storage"

    invoke-virtual {v3, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 609
    invoke-direct {p0, v3, v1}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;->uriForKey(Ljava/util/ArrayList;Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object v6

    .line 610
    sget-object v8, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceType;->AdobeCloudServiceTypeStorage:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceType;

    const-string v9, "files"

    invoke-direct {p0, v8, v9, v6}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;->setServiceType(Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceType;Ljava/lang/String;Ljava/lang/String;)V

    .line 612
    new-instance v3, Ljava/util/ArrayList;

    .end local v3    # "keys":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 613
    .restart local v3    # "keys":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    const-string v8, "assets"

    invoke-virtual {v3, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 614
    const-string v8, "storage"

    invoke-virtual {v3, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 616
    invoke-direct {p0, v3, v1}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;->uriForKey(Ljava/util/ArrayList;Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object v6

    .line 617
    sget-object v8, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceType;->AdobeCloudServiceTypeStorage:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceType;

    const-string v9, "assets"

    invoke-direct {p0, v8, v9, v6}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;->setServiceType(Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceType;Ljava/lang/String;Ljava/lang/String;)V

    .line 620
    new-instance v3, Ljava/util/ArrayList;

    .end local v3    # "keys":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 621
    .restart local v3    # "keys":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    const-string v8, "files"

    invoke-virtual {v3, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 622
    const-string v8, "archive"

    invoke-virtual {v3, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 624
    invoke-direct {p0, v3, v1}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;->uriForKey(Ljava/util/ArrayList;Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object v6

    .line 625
    sget-object v8, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceType;->AdobeCloudServiceTypeStorage:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceType;

    const-string v9, "archive"

    invoke-direct {p0, v8, v9, v6}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;->setServiceType(Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceType;Ljava/lang/String;Ljava/lang/String;)V

    .line 627
    new-instance v3, Ljava/util/ArrayList;

    .end local v3    # "keys":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 628
    .restart local v3    # "keys":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    const-string v8, "libraries"

    invoke-virtual {v3, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 629
    const-string v8, "storage"

    invoke-virtual {v3, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 631
    invoke-direct {p0, v3, v1}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;->uriForKey(Ljava/util/ArrayList;Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object v6

    .line 632
    sget-object v8, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceType;->AdobeCloudServiceTypeStorage:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceType;

    const-string v9, "libraries"

    invoke-direct {p0, v8, v9, v6}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;->setServiceType(Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceType;Ljava/lang/String;Ljava/lang/String;)V

    .line 635
    new-instance v3, Ljava/util/ArrayList;

    .end local v3    # "keys":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 636
    .restart local v3    # "keys":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    const-string v8, "imageservices"

    invoke-virtual {v3, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 637
    const-string v8, "service"

    invoke-virtual {v3, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 639
    invoke-direct {p0, v3, v1}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;->uriForKey(Ljava/util/ArrayList;Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object v6

    .line 640
    sget-object v8, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceType;->AdobeCloudServiceTypeImage:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceType;

    const-string v9, "imageservices"

    invoke-direct {p0, v8, v9, v6}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;->setServiceType(Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceType;Ljava/lang/String;Ljava/lang/String;)V

    .line 642
    new-instance v3, Ljava/util/ArrayList;

    .end local v3    # "keys":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 643
    .restart local v3    # "keys":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    const-string v8, "clipboard"

    invoke-virtual {v3, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 644
    const-string v8, "storage"

    invoke-virtual {v3, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 646
    invoke-direct {p0, v3, v1}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;->uriForKey(Ljava/util/ArrayList;Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object v6

    .line 647
    sget-object v8, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceType;->AdobeCloudServiceTypeClipBoard:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceType;

    const-string v9, "clipboard"

    invoke-direct {p0, v8, v9, v6}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;->setServiceType(Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceType;Ljava/lang/String;Ljava/lang/String;)V

    .end local v3    # "keys":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    :goto_141
    move v9, v10

    .line 657
    goto/16 :goto_5

    .line 564
    .end local v1    # "features":Lorg/json/JSONObject;
    .end local v2    # "hasAccessToStorageServices":Z
    .end local v4    # "parameters":Lorg/json/JSONObject;
    .end local v5    # "status":Ljava/lang/String;
    .end local v6    # "uri":Ljava/lang/String;
    :cond_144
    const-string v8, "iconUrl"

    invoke-virtual {p1, v8, v13}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 565
    .local v7, "urlString":Ljava/lang/String;
    if-eqz v7, :cond_4a

    .line 567
    :try_start_14c
    new-instance v8, Ljava/net/URL;

    const-string v11, "iconUrl"

    const/4 v12, 0x0

    invoke-virtual {p1, v11, v12}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-direct {v8, v11}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    iput-object v8, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;->_logoURL:Ljava/net/URL;

    .line 568
    new-instance v8, Ljava/net/URL;

    invoke-direct {v8, v7}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    iput-object v8, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;->_logoURL:Ljava/net/URL;
    :try_end_161
    .catch Ljava/net/MalformedURLException; {:try_start_14c .. :try_end_161} :catch_163

    goto/16 :goto_4a

    .line 569
    :catch_163
    move-exception v0

    .line 571
    .local v0, "e":Ljava/net/MalformedURLException;
    iput-object v13, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;->_logoURL:Ljava/net/URL;

    goto/16 :goto_4a

    .end local v0    # "e":Ljava/net/MalformedURLException;
    .end local v7    # "urlString":Ljava/lang/String;
    .restart local v5    # "status":Ljava/lang/String;
    :cond_168
    move v8, v9

    .line 576
    goto/16 :goto_63

    :cond_16b
    move v8, v9

    goto/16 :goto_63

    .line 600
    .restart local v1    # "features":Lorg/json/JSONObject;
    .restart local v2    # "hasAccessToStorageServices":Z
    .restart local v4    # "parameters":Lorg/json/JSONObject;
    .restart local v6    # "uri":Ljava/lang/String;
    :cond_16e
    invoke-static {}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices;->getSharedServices()Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices;

    move-result-object v8

    invoke-virtual {v8}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeEntitlementServices;->hasAccessToPublicStorageServices()Z

    move-result v2

    goto/16 :goto_a3

    .line 652
    :cond_178
    iput-boolean v9, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;->_quotaEnabled:Z

    goto :goto_141
.end method

.method public writeExternal(Ljava/io/ObjectOutput;)V
    .registers 4
    .param p1, "objectOutput"    # Ljava/io/ObjectOutput;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 514
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;->_GUID:Ljava/lang/String;

    invoke-interface {p1, v0}, Ljava/io/ObjectOutput;->writeObject(Ljava/lang/Object;)V

    .line 515
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;->_eTag:Ljava/lang/String;

    invoke-interface {p1, v0}, Ljava/io/ObjectOutput;->writeObject(Ljava/lang/Object;)V

    .line 516
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;->_name:Ljava/lang/String;

    invoke-interface {p1, v0}, Ljava/io/ObjectOutput;->writeObject(Ljava/lang/Object;)V

    .line 517
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;->_cloudDescription:Ljava/lang/String;

    invoke-interface {p1, v0}, Ljava/io/ObjectOutput;->writeObject(Ljava/lang/Object;)V

    .line 518
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;->_region:Ljava/lang/String;

    invoke-interface {p1, v0}, Ljava/io/ObjectOutput;->writeObject(Ljava/lang/Object;)V

    .line 519
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;->_logoURL:Ljava/net/URL;

    invoke-interface {p1, v0}, Ljava/io/ObjectOutput;->writeObject(Ljava/lang/Object;)V

    .line 520
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;->_endpoints:Ljava/util/HashMap;

    invoke-interface {p1, v0}, Ljava/io/ObjectOutput;->writeObject(Ljava/lang/Object;)V

    .line 521
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;->_parameters:Lorg/json/JSONObject;

    if-eqz v0, :cond_45

    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;->_parameters:Lorg/json/JSONObject;

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_2d
    invoke-interface {p1, v0}, Ljava/io/ObjectOutput;->writeObject(Ljava/lang/Object;)V

    .line 522
    iget-wide v0, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;->_version:J

    invoke-interface {p1, v0, v1}, Ljava/io/ObjectOutput;->writeLong(J)V

    .line 523
    iget-boolean v0, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;->_available:Z

    invoke-interface {p1, v0}, Ljava/io/ObjectOutput;->writeBoolean(Z)V

    .line 524
    iget-boolean v0, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;->_privateCloud:Z

    invoke-interface {p1, v0}, Ljava/io/ObjectOutput;->writeBoolean(Z)V

    .line 525
    iget-boolean v0, p0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;->_quotaEnabled:Z

    invoke-interface {p1, v0}, Ljava/io/ObjectOutput;->writeBoolean(Z)V

    .line 526
    return-void

    .line 521
    :cond_45
    const/4 v0, 0x0

    goto :goto_2d
.end method
