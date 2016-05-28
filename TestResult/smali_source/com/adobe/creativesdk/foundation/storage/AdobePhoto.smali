.class public Lcom/adobe/creativesdk/foundation/storage/AdobePhoto;
.super Ljava/lang/Object;
.source "AdobePhoto.java"

# interfaces
.implements Ljava/io/Externalizable;


# instance fields
.field protected _GUID:Ljava/lang/String;

.field protected _baseHref:Ljava/lang/String;

.field protected _cloud:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

.field protected _creationDate:Ljava/util/Date;

.field protected _href:Ljava/lang/String;

.field protected _internalID:Ljava/lang/String;

.field protected _modificationDate:Ljava/util/Date;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    const/4 v0, 0x0

    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhoto;->_internalID:Ljava/lang/String;

    .line 48
    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhoto;->_GUID:Ljava/lang/String;

    .line 53
    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhoto;->_href:Ljava/lang/String;

    .line 58
    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhoto;->_baseHref:Ljava/lang/String;

    .line 63
    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhoto;->_creationDate:Ljava/util/Date;

    .line 68
    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhoto;->_modificationDate:Ljava/util/Date;

    .line 70
    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhoto;->_cloud:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    return-void
.end method


# virtual methods
.method public getCloud()Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;
    .registers 2

    .prologue
    .line 161
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhoto;->_cloud:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    return-object v0
.end method

.method public getCreationDate()Ljava/util/Date;
    .registers 2

    .prologue
    .line 133
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhoto;->_creationDate:Ljava/util/Date;

    return-object v0
.end method

.method public getGUID()Ljava/lang/String;
    .registers 2

    .prologue
    .line 91
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhoto;->_GUID:Ljava/lang/String;

    return-object v0
.end method

.method public getHref()Ljava/lang/String;
    .registers 2

    .prologue
    .line 105
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhoto;->_href:Ljava/lang/String;

    return-object v0
.end method

.method public getModificationDate()Ljava/util/Date;
    .registers 2

    .prologue
    .line 147
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhoto;->_modificationDate:Ljava/util/Date;

    return-object v0
.end method

.method protected getSession()Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;
    .registers 3

    .prologue
    .line 217
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhoto;->_cloud:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    sget-object v1, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceType;->AdobeCloudServiceTypePhoto:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceType;

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;->getSessionForService(Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceType;)Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloudServiceSession;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;

    check-cast v0, Lcom/adobe/creativesdk/foundation/internal/storage/photo/AdobePhotoSession;

    return-object v0
.end method

.method public readExternal(Ljava/io/ObjectInput;)V
    .registers 3
    .param p1, "objectInput"    # Ljava/io/ObjectInput;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .prologue
    .line 196
    invoke-interface {p1}, Ljava/io/ObjectInput;->readObject()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhoto;->_internalID:Ljava/lang/String;

    .line 197
    invoke-interface {p1}, Ljava/io/ObjectInput;->readObject()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhoto;->_GUID:Ljava/lang/String;

    .line 198
    invoke-interface {p1}, Ljava/io/ObjectInput;->readObject()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhoto;->_href:Ljava/lang/String;

    .line 199
    invoke-interface {p1}, Ljava/io/ObjectInput;->readObject()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhoto;->_baseHref:Ljava/lang/String;

    .line 200
    invoke-interface {p1}, Ljava/io/ObjectInput;->readObject()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Date;

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhoto;->_creationDate:Ljava/util/Date;

    .line 201
    invoke-interface {p1}, Ljava/io/ObjectInput;->readObject()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Date;

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhoto;->_modificationDate:Ljava/util/Date;

    .line 202
    invoke-interface {p1}, Ljava/io/ObjectInput;->readObject()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhoto;->_cloud:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    .line 203
    return-void
.end method

.method public setBaseHref(Ljava/lang/String;)V
    .registers 2
    .param p1, "baseHref"    # Ljava/lang/String;

    .prologue
    .line 126
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhoto;->_baseHref:Ljava/lang/String;

    .line 127
    return-void
.end method

.method public setCloud(Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;)V
    .registers 2
    .param p1, "_cloud"    # Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    .prologue
    .line 168
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhoto;->_cloud:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    .line 169
    return-void
.end method

.method public setHref(Ljava/lang/String;)V
    .registers 2
    .param p1, "href"    # Ljava/lang/String;

    .prologue
    .line 112
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhoto;->_href:Ljava/lang/String;

    .line 113
    return-void
.end method

.method public writeExternal(Ljava/io/ObjectOutput;)V
    .registers 3
    .param p1, "objectOutput"    # Ljava/io/ObjectOutput;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 207
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhoto;->_internalID:Ljava/lang/String;

    invoke-interface {p1, v0}, Ljava/io/ObjectOutput;->writeObject(Ljava/lang/Object;)V

    .line 208
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhoto;->_GUID:Ljava/lang/String;

    invoke-interface {p1, v0}, Ljava/io/ObjectOutput;->writeObject(Ljava/lang/Object;)V

    .line 209
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhoto;->_href:Ljava/lang/String;

    invoke-interface {p1, v0}, Ljava/io/ObjectOutput;->writeObject(Ljava/lang/Object;)V

    .line 210
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhoto;->_baseHref:Ljava/lang/String;

    invoke-interface {p1, v0}, Ljava/io/ObjectOutput;->writeObject(Ljava/lang/Object;)V

    .line 211
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhoto;->_creationDate:Ljava/util/Date;

    invoke-interface {p1, v0}, Ljava/io/ObjectOutput;->writeObject(Ljava/lang/Object;)V

    .line 212
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhoto;->_modificationDate:Ljava/util/Date;

    invoke-interface {p1, v0}, Ljava/io/ObjectOutput;->writeObject(Ljava/lang/Object;)V

    .line 213
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhoto;->_cloud:Lcom/adobe/creativesdk/foundation/adobeinternal/cloud/AdobeCloud;

    invoke-interface {p1, v0}, Ljava/io/ObjectOutput;->writeObject(Ljava/lang/Object;)V

    .line 214
    return-void
.end method
