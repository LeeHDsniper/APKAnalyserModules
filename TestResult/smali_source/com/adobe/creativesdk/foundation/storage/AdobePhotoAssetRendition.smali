.class public Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAssetRendition;
.super Ljava/lang/Object;
.source "AdobePhotoAssetRendition.java"

# interfaces
.implements Ljava/io/Externalizable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAssetRendition$AdobePhotoAssetRenditionType;
    }
.end annotation


# instance fields
.field private _GUID:Ljava/lang/String;

.field private _dataPath:Ljava/net/URI;

.field private _type:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAssetRendition$AdobePhotoAssetRenditionType;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 127
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 129
    return-void
.end method

.method public constructor <init>(Ljava/net/URI;Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAssetRendition$AdobePhotoAssetRenditionType;)V
    .registers 4
    .param p1, "path"    # Ljava/net/URI;
    .param p2, "type"    # Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAssetRendition$AdobePhotoAssetRenditionType;

    .prologue
    .line 132
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 133
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAssetRendition;->_dataPath:Ljava/net/URI;

    .line 134
    iput-object p2, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAssetRendition;->_type:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAssetRendition$AdobePhotoAssetRenditionType;

    .line 135
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/photo/util/AdobePhotoUtils;->generateGUID()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAssetRendition;->_GUID:Ljava/lang/String;

    .line 136
    return-void
.end method


# virtual methods
.method public getDataPath()Ljava/net/URI;
    .registers 2

    .prologue
    .line 108
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAssetRendition;->_dataPath:Ljava/net/URI;

    return-object v0
.end method

.method public getGUID()Ljava/lang/String;
    .registers 2

    .prologue
    .line 100
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAssetRendition;->_GUID:Ljava/lang/String;

    return-object v0
.end method

.method public getType()Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAssetRendition$AdobePhotoAssetRenditionType;
    .registers 2

    .prologue
    .line 119
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAssetRendition;->_type:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAssetRendition$AdobePhotoAssetRenditionType;

    return-object v0
.end method

.method public readExternal(Ljava/io/ObjectInput;)V
    .registers 4
    .param p1, "objectInput"    # Ljava/io/ObjectInput;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .prologue
    .line 140
    invoke-interface {p1}, Ljava/io/ObjectInput;->readObject()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAssetRendition;->_GUID:Ljava/lang/String;

    .line 141
    invoke-interface {p1}, Ljava/io/ObjectInput;->readObject()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/net/URI;

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAssetRendition;->_dataPath:Ljava/net/URI;

    .line 142
    invoke-static {}, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAssetRendition$AdobePhotoAssetRenditionType;->values()[Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAssetRendition$AdobePhotoAssetRenditionType;

    move-result-object v0

    invoke-interface {p1}, Ljava/io/ObjectInput;->readInt()I

    move-result v1

    aget-object v0, v0, v1

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAssetRendition;->_type:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAssetRendition$AdobePhotoAssetRenditionType;

    .line 143
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
    .line 147
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAssetRendition;->_GUID:Ljava/lang/String;

    invoke-interface {p1, v0}, Ljava/io/ObjectOutput;->writeObject(Ljava/lang/Object;)V

    .line 148
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAssetRendition;->_dataPath:Ljava/net/URI;

    invoke-interface {p1, v0}, Ljava/io/ObjectOutput;->writeObject(Ljava/lang/Object;)V

    .line 149
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAssetRendition;->_type:Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAssetRendition$AdobePhotoAssetRenditionType;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAssetRendition$AdobePhotoAssetRenditionType;->getValue()I

    move-result v0

    invoke-interface {p1, v0}, Ljava/io/ObjectOutput;->writeInt(I)V

    .line 150
    return-void
.end method
