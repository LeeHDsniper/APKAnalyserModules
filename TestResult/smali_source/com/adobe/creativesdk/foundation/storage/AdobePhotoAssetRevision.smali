.class public Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAssetRevision;
.super Ljava/lang/Object;
.source "AdobePhotoAssetRevision.java"

# interfaces
.implements Ljava/io/Externalizable;


# instance fields
.field private _GUID:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 83
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAssetRevision;->_GUID:Ljava/lang/String;

    .line 84
    invoke-static {}, Lcom/adobe/creativesdk/foundation/internal/photo/util/AdobePhotoUtils;->generateGUID()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAssetRevision;->_GUID:Ljava/lang/String;

    .line 85
    return-void
.end method

.method constructor <init>(Ljava/lang/String;Z)V
    .registers 7
    .param p1, "val"    # Ljava/lang/String;
    .param p2, "isGuid"    # Z

    .prologue
    .line 88
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    const/4 v3, 0x0

    iput-object v3, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAssetRevision;->_GUID:Ljava/lang/String;

    .line 89
    if-eqz p2, :cond_b

    .line 90
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAssetRevision;->_GUID:Ljava/lang/String;

    .line 100
    :cond_a
    :goto_a
    return-void

    .line 92
    :cond_b
    const-string v2, "/revisions/([a-zA-Z0-9]+)"

    .line 93
    .local v2, "regex":Ljava/lang/String;
    const/4 v3, 0x2

    invoke-static {v2, v3}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object v1

    .line 94
    .local v1, "p":Ljava/util/regex/Pattern;
    invoke-virtual {v1, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    .line 96
    .local v0, "m":Ljava/util/regex/Matcher;
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->find()Z

    move-result v3

    if-eqz v3, :cond_a

    .line 97
    const/4 v3, 0x1

    invoke-virtual {v0, v3}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAssetRevision;->_GUID:Ljava/lang/String;

    goto :goto_a
.end method


# virtual methods
.method public getGUID()Ljava/lang/String;
    .registers 2

    .prologue
    .line 45
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAssetRevision;->_GUID:Ljava/lang/String;

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
    .line 74
    invoke-interface {p1}, Ljava/io/ObjectInput;->readObject()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAssetRevision;->_GUID:Ljava/lang/String;

    .line 75
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
    .line 79
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoAssetRevision;->_GUID:Ljava/lang/String;

    invoke-interface {p1, v0}, Ljava/io/ObjectOutput;->writeObject(Ljava/lang/Object;)V

    .line 80
    return-void
.end method
