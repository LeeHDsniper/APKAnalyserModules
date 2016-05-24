.class public Lcom/adobe/creativesdk/foundation/storage/AdobePhotoPage;
.super Ljava/lang/Object;
.source "AdobePhotoPage.java"

# interfaces
.implements Ljava/io/Externalizable;


# instance fields
.field private _key:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 2
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 65
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 66
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoPage;->_key:Ljava/lang/String;

    .line 67
    return-void
.end method


# virtual methods
.method public getKey()Ljava/lang/String;
    .registers 2

    .prologue
    .line 43
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoPage;->_key:Ljava/lang/String;

    return-object v0
.end method

.method public isEqualToPage(Lcom/adobe/creativesdk/foundation/storage/AdobePhotoPage;)Z
    .registers 4
    .param p1, "page"    # Lcom/adobe/creativesdk/foundation/storage/AdobePhotoPage;

    .prologue
    .line 38
    invoke-virtual {p1}, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoPage;->getKey()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoPage;->_key:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
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
    .line 53
    invoke-interface {p1}, Ljava/io/ObjectInput;->readObject()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoPage;->_key:Ljava/lang/String;

    .line 54
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
    .line 58
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/storage/AdobePhotoPage;->_key:Ljava/lang/String;

    invoke-interface {p1, v0}, Ljava/io/ObjectOutput;->writeObject(Ljava/lang/Object;)V

    .line 59
    return-void
.end method
