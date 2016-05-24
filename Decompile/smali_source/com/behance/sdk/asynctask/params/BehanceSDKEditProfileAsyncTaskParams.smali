.class public Lcom/behance/sdk/asynctask/params/BehanceSDKEditProfileAsyncTaskParams;
.super Lcom/behance/sdk/asynctask/params/BehanceSDKAbstractTaskParams;
.source "BehanceSDKEditProfileAsyncTaskParams.java"


# instance fields
.field private city:Ljava/lang/String;

.field private company:Ljava/lang/String;

.field private country:Ljava/lang/String;

.field private firstName:Ljava/lang/String;

.field private image:Lcom/behance/sdk/project/modules/ImageModule;

.field private lastName:Ljava/lang/String;

.field private occupation:Ljava/lang/String;

.field private profileImageBitmap:Landroid/graphics/Bitmap;

.field private state:Ljava/lang/String;

.field private website:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 10
    invoke-direct {p0}, Lcom/behance/sdk/asynctask/params/BehanceSDKAbstractTaskParams;-><init>()V

    return-void
.end method


# virtual methods
.method public getCity()Ljava/lang/String;
    .registers 2

    .prologue
    .line 88
    iget-object v0, p0, Lcom/behance/sdk/asynctask/params/BehanceSDKEditProfileAsyncTaskParams;->city:Ljava/lang/String;

    return-object v0
.end method

.method public getCompany()Ljava/lang/String;
    .registers 2

    .prologue
    .line 52
    iget-object v0, p0, Lcom/behance/sdk/asynctask/params/BehanceSDKEditProfileAsyncTaskParams;->company:Ljava/lang/String;

    return-object v0
.end method

.method public getCountry()Ljava/lang/String;
    .registers 2

    .prologue
    .line 72
    iget-object v0, p0, Lcom/behance/sdk/asynctask/params/BehanceSDKEditProfileAsyncTaskParams;->country:Ljava/lang/String;

    return-object v0
.end method

.method public getFirstName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 28
    iget-object v0, p0, Lcom/behance/sdk/asynctask/params/BehanceSDKEditProfileAsyncTaskParams;->firstName:Ljava/lang/String;

    return-object v0
.end method

.method public getImage()Lcom/behance/sdk/project/modules/ImageModule;
    .registers 2

    .prologue
    .line 96
    iget-object v0, p0, Lcom/behance/sdk/asynctask/params/BehanceSDKEditProfileAsyncTaskParams;->image:Lcom/behance/sdk/project/modules/ImageModule;

    return-object v0
.end method

.method public getLastName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 36
    iget-object v0, p0, Lcom/behance/sdk/asynctask/params/BehanceSDKEditProfileAsyncTaskParams;->lastName:Ljava/lang/String;

    return-object v0
.end method

.method public getOccupation()Ljava/lang/String;
    .registers 2

    .prologue
    .line 44
    iget-object v0, p0, Lcom/behance/sdk/asynctask/params/BehanceSDKEditProfileAsyncTaskParams;->occupation:Ljava/lang/String;

    return-object v0
.end method

.method public getProfileImageBitmap()Landroid/graphics/Bitmap;
    .registers 2

    .prologue
    .line 100
    iget-object v0, p0, Lcom/behance/sdk/asynctask/params/BehanceSDKEditProfileAsyncTaskParams;->profileImageBitmap:Landroid/graphics/Bitmap;

    return-object v0
.end method

.method public getState()Ljava/lang/String;
    .registers 2

    .prologue
    .line 80
    iget-object v0, p0, Lcom/behance/sdk/asynctask/params/BehanceSDKEditProfileAsyncTaskParams;->state:Ljava/lang/String;

    return-object v0
.end method

.method public getWebsite()Ljava/lang/String;
    .registers 2

    .prologue
    .line 64
    iget-object v0, p0, Lcom/behance/sdk/asynctask/params/BehanceSDKEditProfileAsyncTaskParams;->website:Ljava/lang/String;

    return-object v0
.end method

.method public setCity(Ljava/lang/String;)V
    .registers 2
    .param p1, "city"    # Ljava/lang/String;

    .prologue
    .line 84
    iput-object p1, p0, Lcom/behance/sdk/asynctask/params/BehanceSDKEditProfileAsyncTaskParams;->city:Ljava/lang/String;

    .line 85
    return-void
.end method

.method public setCompany(Ljava/lang/String;)V
    .registers 2
    .param p1, "company"    # Ljava/lang/String;

    .prologue
    .line 48
    iput-object p1, p0, Lcom/behance/sdk/asynctask/params/BehanceSDKEditProfileAsyncTaskParams;->company:Ljava/lang/String;

    .line 49
    return-void
.end method

.method public setCountry(Ljava/lang/String;)V
    .registers 2
    .param p1, "country"    # Ljava/lang/String;

    .prologue
    .line 68
    iput-object p1, p0, Lcom/behance/sdk/asynctask/params/BehanceSDKEditProfileAsyncTaskParams;->country:Ljava/lang/String;

    .line 69
    return-void
.end method

.method public setFirstName(Ljava/lang/String;)V
    .registers 2
    .param p1, "firstName"    # Ljava/lang/String;

    .prologue
    .line 24
    iput-object p1, p0, Lcom/behance/sdk/asynctask/params/BehanceSDKEditProfileAsyncTaskParams;->firstName:Ljava/lang/String;

    .line 25
    return-void
.end method

.method public setImage(Lcom/behance/sdk/project/modules/ImageModule;)V
    .registers 2
    .param p1, "image"    # Lcom/behance/sdk/project/modules/ImageModule;

    .prologue
    .line 92
    iput-object p1, p0, Lcom/behance/sdk/asynctask/params/BehanceSDKEditProfileAsyncTaskParams;->image:Lcom/behance/sdk/project/modules/ImageModule;

    .line 93
    return-void
.end method

.method public setLastName(Ljava/lang/String;)V
    .registers 2
    .param p1, "lastName"    # Ljava/lang/String;

    .prologue
    .line 32
    iput-object p1, p0, Lcom/behance/sdk/asynctask/params/BehanceSDKEditProfileAsyncTaskParams;->lastName:Ljava/lang/String;

    .line 33
    return-void
.end method

.method public setOccupation(Ljava/lang/String;)V
    .registers 2
    .param p1, "occupation"    # Ljava/lang/String;

    .prologue
    .line 40
    iput-object p1, p0, Lcom/behance/sdk/asynctask/params/BehanceSDKEditProfileAsyncTaskParams;->occupation:Ljava/lang/String;

    .line 41
    return-void
.end method

.method public setProfileImageBitmap(Landroid/graphics/Bitmap;)V
    .registers 2
    .param p1, "profileImageBitmap"    # Landroid/graphics/Bitmap;

    .prologue
    .line 104
    iput-object p1, p0, Lcom/behance/sdk/asynctask/params/BehanceSDKEditProfileAsyncTaskParams;->profileImageBitmap:Landroid/graphics/Bitmap;

    .line 105
    return-void
.end method

.method public setState(Ljava/lang/String;)V
    .registers 2
    .param p1, "state"    # Ljava/lang/String;

    .prologue
    .line 76
    iput-object p1, p0, Lcom/behance/sdk/asynctask/params/BehanceSDKEditProfileAsyncTaskParams;->state:Ljava/lang/String;

    .line 77
    return-void
.end method

.method public setWebsite(Ljava/lang/String;)V
    .registers 4
    .param p1, "website"    # Ljava/lang/String;

    .prologue
    .line 56
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x3

    if-le v0, v1, :cond_38

    .line 57
    const-string v0, "http://"

    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_38

    const-string v0, "https://"

    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_38

    const/4 v0, 0x0

    const/4 v1, 0x2

    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    const-string v1, "www"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_38

    .line 58
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "http://www."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 60
    :cond_38
    iput-object p1, p0, Lcom/behance/sdk/asynctask/params/BehanceSDKEditProfileAsyncTaskParams;->website:Ljava/lang/String;

    .line 61
    return-void
.end method
