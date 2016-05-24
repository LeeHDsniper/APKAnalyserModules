.class public Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;
.super Landroid/support/v4/app/Fragment;
.source "BehanceSDKEditProfileHeadlessFragment.java"

# interfaces
.implements Lcom/behance/sdk/asynctask/listeners/IBehanceSDKEditProfileAsyncTaskListener;
.implements Lcom/behance/sdk/asynctask/listeners/IBehanceSDKGetUserProfileAsyncTaskListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment$Callbacks;
    }
.end annotation


# instance fields
.field private callbacks:Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment$Callbacks;

.field private city:Lcom/behance/sdk/dto/location/BehanceSDKCityDTO;

.field private company:Ljava/lang/String;

.field private country:Lcom/behance/sdk/dto/location/BehanceSDKCountryDTO;

.field private editProfileAsyncTask:Lcom/behance/sdk/asynctasks/BehanceSDKEditProfileAsyncTask;

.field private editProfileTaskInProgress:Z

.field private firstName:Ljava/lang/String;

.field private getUserProfileAsyncTask:Lcom/behance/sdk/asynctasks/BehanceSDKGetUserProfileAsyncTask;

.field private getUserProfileTaskInProgress:Z

.field private imageBitmap:Landroid/graphics/Bitmap;

.field private imageModule:Lcom/behance/sdk/project/modules/ImageModule;

.field private lastName:Ljava/lang/String;

.field private occupation:Ljava/lang/String;

.field private originalImageUrl:Ljava/lang/String;

.field private state:Lcom/behance/sdk/dto/location/BehanceSDKStateDTO;

.field private website:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    const/4 v0, 0x0

    .line 106
    invoke-direct {p0}, Landroid/support/v4/app/Fragment;-><init>()V

    .line 27
    iput-boolean v0, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;->getUserProfileTaskInProgress:Z

    .line 29
    iput-boolean v0, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;->editProfileTaskInProgress:Z

    .line 107
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;->setRetainInstance(Z)V

    .line 108
    return-void
.end method

.method private applyParamChanges()Lcom/behance/sdk/asynctask/params/BehanceSDKEditProfileAsyncTaskParams;
    .registers 3

    .prologue
    .line 141
    new-instance v0, Lcom/behance/sdk/asynctask/params/BehanceSDKEditProfileAsyncTaskParams;

    invoke-direct {v0}, Lcom/behance/sdk/asynctask/params/BehanceSDKEditProfileAsyncTaskParams;-><init>()V

    .line 142
    .local v0, "params":Lcom/behance/sdk/asynctask/params/BehanceSDKEditProfileAsyncTaskParams;
    iget-object v1, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;->firstName:Ljava/lang/String;

    if-eqz v1, :cond_e

    .line 143
    iget-object v1, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;->firstName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/behance/sdk/asynctask/params/BehanceSDKEditProfileAsyncTaskParams;->setFirstName(Ljava/lang/String;)V

    .line 144
    :cond_e
    iget-object v1, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;->lastName:Ljava/lang/String;

    if-eqz v1, :cond_17

    .line 145
    iget-object v1, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;->lastName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/behance/sdk/asynctask/params/BehanceSDKEditProfileAsyncTaskParams;->setLastName(Ljava/lang/String;)V

    .line 146
    :cond_17
    iget-object v1, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;->occupation:Ljava/lang/String;

    if-eqz v1, :cond_20

    .line 147
    iget-object v1, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;->occupation:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/behance/sdk/asynctask/params/BehanceSDKEditProfileAsyncTaskParams;->setOccupation(Ljava/lang/String;)V

    .line 148
    :cond_20
    iget-object v1, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;->company:Ljava/lang/String;

    if-eqz v1, :cond_29

    .line 149
    iget-object v1, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;->company:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/behance/sdk/asynctask/params/BehanceSDKEditProfileAsyncTaskParams;->setCompany(Ljava/lang/String;)V

    .line 150
    :cond_29
    iget-object v1, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;->website:Ljava/lang/String;

    if-eqz v1, :cond_32

    .line 151
    iget-object v1, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;->website:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/behance/sdk/asynctask/params/BehanceSDKEditProfileAsyncTaskParams;->setWebsite(Ljava/lang/String;)V

    .line 152
    :cond_32
    iget-object v1, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;->country:Lcom/behance/sdk/dto/location/BehanceSDKCountryDTO;

    if-eqz v1, :cond_3f

    .line 153
    iget-object v1, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;->country:Lcom/behance/sdk/dto/location/BehanceSDKCountryDTO;

    invoke-virtual {v1}, Lcom/behance/sdk/dto/location/BehanceSDKCountryDTO;->getDisplayName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/behance/sdk/asynctask/params/BehanceSDKEditProfileAsyncTaskParams;->setCountry(Ljava/lang/String;)V

    .line 154
    :cond_3f
    iget-object v1, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;->state:Lcom/behance/sdk/dto/location/BehanceSDKStateDTO;

    if-eqz v1, :cond_4c

    .line 155
    iget-object v1, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;->state:Lcom/behance/sdk/dto/location/BehanceSDKStateDTO;

    invoke-virtual {v1}, Lcom/behance/sdk/dto/location/BehanceSDKStateDTO;->getDisplayName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/behance/sdk/asynctask/params/BehanceSDKEditProfileAsyncTaskParams;->setState(Ljava/lang/String;)V

    .line 156
    :cond_4c
    iget-object v1, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;->city:Lcom/behance/sdk/dto/location/BehanceSDKCityDTO;

    if-eqz v1, :cond_59

    .line 157
    iget-object v1, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;->city:Lcom/behance/sdk/dto/location/BehanceSDKCityDTO;

    invoke-virtual {v1}, Lcom/behance/sdk/dto/location/BehanceSDKCityDTO;->getDisplayName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/behance/sdk/asynctask/params/BehanceSDKEditProfileAsyncTaskParams;->setCity(Ljava/lang/String;)V

    .line 158
    :cond_59
    iget-object v1, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;->imageModule:Lcom/behance/sdk/project/modules/ImageModule;

    if-eqz v1, :cond_62

    .line 159
    iget-object v1, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;->imageModule:Lcom/behance/sdk/project/modules/ImageModule;

    invoke-virtual {v0, v1}, Lcom/behance/sdk/asynctask/params/BehanceSDKEditProfileAsyncTaskParams;->setImage(Lcom/behance/sdk/project/modules/ImageModule;)V

    .line 160
    :cond_62
    iget-object v1, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;->imageBitmap:Landroid/graphics/Bitmap;

    if-eqz v1, :cond_6b

    .line 161
    iget-object v1, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;->imageBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v0, v1}, Lcom/behance/sdk/asynctask/params/BehanceSDKEditProfileAsyncTaskParams;->setProfileImageBitmap(Landroid/graphics/Bitmap;)V

    .line 162
    :cond_6b
    return-object v0
.end method


# virtual methods
.method public getCity()Lcom/behance/sdk/dto/location/BehanceSDKCityDTO;
    .registers 2

    .prologue
    .line 241
    iget-object v0, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;->city:Lcom/behance/sdk/dto/location/BehanceSDKCityDTO;

    return-object v0
.end method

.method public getCompany()Ljava/lang/String;
    .registers 2

    .prologue
    .line 209
    iget-object v0, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;->company:Ljava/lang/String;

    return-object v0
.end method

.method public getCountry()Lcom/behance/sdk/dto/location/BehanceSDKCountryDTO;
    .registers 2

    .prologue
    .line 225
    iget-object v0, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;->country:Lcom/behance/sdk/dto/location/BehanceSDKCountryDTO;

    return-object v0
.end method

.method public getFirstName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 185
    iget-object v0, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;->firstName:Ljava/lang/String;

    return-object v0
.end method

.method public getImageBitmap()Landroid/graphics/Bitmap;
    .registers 2

    .prologue
    .line 92
    iget-object v0, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;->imageBitmap:Landroid/graphics/Bitmap;

    return-object v0
.end method

.method public getLastName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 193
    iget-object v0, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;->lastName:Ljava/lang/String;

    return-object v0
.end method

.method public getOccupation()Ljava/lang/String;
    .registers 2

    .prologue
    .line 201
    iget-object v0, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;->occupation:Ljava/lang/String;

    return-object v0
.end method

.method public getOriginalImageUrl()Ljava/lang/String;
    .registers 2

    .prologue
    .line 80
    iget-object v0, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;->originalImageUrl:Ljava/lang/String;

    return-object v0
.end method

.method public getState()Lcom/behance/sdk/dto/location/BehanceSDKStateDTO;
    .registers 2

    .prologue
    .line 233
    iget-object v0, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;->state:Lcom/behance/sdk/dto/location/BehanceSDKStateDTO;

    return-object v0
.end method

.method public getWebsite()Ljava/lang/String;
    .registers 2

    .prologue
    .line 217
    iget-object v0, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;->website:Ljava/lang/String;

    return-object v0
.end method

.method public isEditProfileTaskInProgress()Z
    .registers 2

    .prologue
    .line 119
    iget-boolean v0, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;->editProfileTaskInProgress:Z

    return v0
.end method

.method public isGetUserProfileTaskInProgress()Z
    .registers 2

    .prologue
    .line 111
    iget-boolean v0, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;->getUserProfileTaskInProgress:Z

    return v0
.end method

.method public isValidLocation()Z
    .registers 4

    .prologue
    const/4 v0, 0x0

    .line 253
    iget-object v1, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;->country:Lcom/behance/sdk/dto/location/BehanceSDKCountryDTO;

    if-eqz v1, :cond_13

    const-string v1, "WORLD_WIDE_COUNTRY_ID"

    iget-object v2, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;->country:Lcom/behance/sdk/dto/location/BehanceSDKCountryDTO;

    invoke-virtual {v2}, Lcom/behance/sdk/dto/location/BehanceSDKCountryDTO;->getId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_14

    .line 263
    :cond_13
    :goto_13
    return v0

    .line 256
    :cond_14
    sget-object v1, Lcom/behance/sdk/dto/location/BehanceSDKCountryDTO;->COUNTRY_CODES_FOR_LOAD_STATES:Ljava/util/List;

    iget-object v2, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;->country:Lcom/behance/sdk/dto/location/BehanceSDKCountryDTO;

    invoke-virtual {v2}, Lcom/behance/sdk/dto/location/BehanceSDKCountryDTO;->getId()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_26

    iget-object v1, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;->state:Lcom/behance/sdk/dto/location/BehanceSDKStateDTO;

    if-eqz v1, :cond_13

    :cond_26
    iget-object v1, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;->state:Lcom/behance/sdk/dto/location/BehanceSDKStateDTO;

    if-eqz v1, :cond_38

    const-string v1, "ALL_STATES_ID"

    iget-object v2, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;->state:Lcom/behance/sdk/dto/location/BehanceSDKStateDTO;

    .line 257
    invoke-virtual {v2}, Lcom/behance/sdk/dto/location/BehanceSDKStateDTO;->getId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_13

    .line 260
    :cond_38
    iget-object v1, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;->city:Lcom/behance/sdk/dto/location/BehanceSDKCityDTO;

    if-eqz v1, :cond_13

    const-string v1, "ALL_CITIES_ID"

    iget-object v2, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;->city:Lcom/behance/sdk/dto/location/BehanceSDKCityDTO;

    invoke-virtual {v2}, Lcom/behance/sdk/dto/location/BehanceSDKCityDTO;->getId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_13

    .line 263
    const/4 v0, 0x1

    goto :goto_13
.end method

.method public loadUserDetailsFromServer()V
    .registers 7

    .prologue
    const/4 v4, 0x1

    .line 166
    invoke-virtual {p0}, Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;->isGetUserProfileTaskInProgress()Z

    move-result v3

    if-nez v3, :cond_3a

    iget-object v3, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;->getUserProfileAsyncTask:Lcom/behance/sdk/asynctasks/BehanceSDKGetUserProfileAsyncTask;

    if-nez v3, :cond_3a

    .line 167
    invoke-virtual {p0, v4}, Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;->setGetUserProfileTaskInProgress(Z)V

    .line 169
    new-instance v1, Lcom/behance/sdk/asynctask/params/BehanceSDKGetUserProfileTaskParams;

    invoke-direct {v1}, Lcom/behance/sdk/asynctask/params/BehanceSDKGetUserProfileTaskParams;-><init>()V

    .line 170
    .local v1, "params":Lcom/behance/sdk/asynctask/params/BehanceSDKGetUserProfileTaskParams;
    invoke-static {}, Lcom/behance/sdk/managers/BehanceSDKEditProfileManager;->getInstance()Lcom/behance/sdk/managers/BehanceSDKEditProfileManager;

    move-result-object v0

    .line 171
    .local v0, "manager":Lcom/behance/sdk/managers/BehanceSDKEditProfileManager;
    invoke-virtual {v0}, Lcom/behance/sdk/managers/BehanceSDKEditProfileManager;->getUserCredentials()Lcom/behance/sdk/IBehanceSDKUserCredentials;

    move-result-object v2

    .line 172
    .local v2, "userCredentials":Lcom/behance/sdk/IBehanceSDKUserCredentials;
    invoke-interface {v2}, Lcom/behance/sdk/IBehanceSDKUserCredentials;->getUserBehanceAccountId()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Lcom/behance/sdk/asynctask/params/BehanceSDKGetUserProfileTaskParams;->setUserId(Ljava/lang/String;)V

    .line 173
    invoke-interface {v2}, Lcom/behance/sdk/IBehanceSDKUserCredentials;->getClientId()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Lcom/behance/sdk/asynctask/params/BehanceSDKGetUserProfileTaskParams;->setClientId(Ljava/lang/String;)V

    .line 175
    new-instance v3, Lcom/behance/sdk/asynctasks/BehanceSDKGetUserProfileAsyncTask;

    invoke-direct {v3, p0}, Lcom/behance/sdk/asynctasks/BehanceSDKGetUserProfileAsyncTask;-><init>(Lcom/behance/sdk/asynctask/listeners/IBehanceSDKGetUserProfileAsyncTaskListener;)V

    iput-object v3, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;->getUserProfileAsyncTask:Lcom/behance/sdk/asynctasks/BehanceSDKGetUserProfileAsyncTask;

    .line 176
    iget-object v3, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;->getUserProfileAsyncTask:Lcom/behance/sdk/asynctasks/BehanceSDKGetUserProfileAsyncTask;

    new-array v4, v4, [Lcom/behance/sdk/asynctask/params/BehanceSDKGetUserProfileTaskParams;

    const/4 v5, 0x0

    aput-object v1, v4, v5

    invoke-virtual {v3, v4}, Lcom/behance/sdk/asynctasks/BehanceSDKGetUserProfileAsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 178
    .end local v0    # "manager":Lcom/behance/sdk/managers/BehanceSDKEditProfileManager;
    .end local v1    # "params":Lcom/behance/sdk/asynctask/params/BehanceSDKGetUserProfileTaskParams;
    .end local v2    # "userCredentials":Lcom/behance/sdk/IBehanceSDKUserCredentials;
    :cond_3a
    return-void
.end method

.method public onEditProfileTaskFailure(Lcom/behance/sdk/asynctasks/result/BehanceSDKEditProfileTaskResult;)V
    .registers 3
    .param p1, "result"    # Lcom/behance/sdk/asynctasks/result/BehanceSDKEditProfileTaskResult;

    .prologue
    .line 75
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;->setEditProfileTaskInProgress(Z)V

    .line 76
    iget-object v0, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;->callbacks:Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment$Callbacks;

    invoke-interface {v0, p1}, Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment$Callbacks;->onEditProfileFailure(Lcom/behance/sdk/asynctasks/result/BehanceSDKEditProfileTaskResult;)V

    .line 77
    return-void
.end method

.method public onEditProfileTaskSuccess(Lcom/behance/sdk/asynctasks/result/BehanceSDKEditProfileTaskResult;)V
    .registers 3
    .param p1, "result"    # Lcom/behance/sdk/asynctasks/result/BehanceSDKEditProfileTaskResult;

    .prologue
    .line 69
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;->setEditProfileTaskInProgress(Z)V

    .line 70
    iget-object v0, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;->callbacks:Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment$Callbacks;

    invoke-interface {v0, p1}, Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment$Callbacks;->onEditProfileSuccess(Lcom/behance/sdk/asynctasks/result/BehanceSDKEditProfileTaskResult;)V

    .line 71
    return-void
.end method

.method public onGetUserProfileFailure(Ljava/lang/Exception;Lcom/behance/sdk/asynctask/params/BehanceSDKGetUserProfileTaskParams;)V
    .registers 4
    .param p1, "e"    # Ljava/lang/Exception;
    .param p2, "params"    # Lcom/behance/sdk/asynctask/params/BehanceSDKGetUserProfileTaskParams;

    .prologue
    .line 63
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;->setGetUserProfileTaskInProgress(Z)V

    .line 64
    iget-object v0, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;->callbacks:Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment$Callbacks;

    invoke-interface {v0, p1, p2}, Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment$Callbacks;->onGetUserProfileFailure(Ljava/lang/Exception;Lcom/behance/sdk/asynctask/params/BehanceSDKGetUserProfileTaskParams;)V

    .line 65
    return-void
.end method

.method public onGetUserProfileSuccess(Lcom/behance/sdk/asynctasks/result/BehanceSDKGetUserProfileTaskResult;Lcom/behance/sdk/asynctask/params/BehanceSDKGetUserProfileTaskParams;)V
    .registers 5
    .param p1, "result"    # Lcom/behance/sdk/asynctasks/result/BehanceSDKGetUserProfileTaskResult;
    .param p2, "params"    # Lcom/behance/sdk/asynctask/params/BehanceSDKGetUserProfileTaskParams;

    .prologue
    .line 47
    invoke-virtual {p1}, Lcom/behance/sdk/asynctasks/result/BehanceSDKGetUserProfileTaskResult;->getBehanceUserProfile()Lcom/behance/sdk/BehanceSDKUserProfile;

    move-result-object v0

    .line 48
    .local v0, "userProfile":Lcom/behance/sdk/BehanceSDKUserProfile;
    invoke-virtual {v0}, Lcom/behance/sdk/BehanceSDKUserProfile;->getFirstName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;->setFirstName(Ljava/lang/String;)V

    .line 49
    invoke-virtual {v0}, Lcom/behance/sdk/BehanceSDKUserProfile;->getLastName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;->setLastName(Ljava/lang/String;)V

    .line 50
    invoke-virtual {v0}, Lcom/behance/sdk/BehanceSDKUserProfile;->getOccupation()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;->setOccupation(Ljava/lang/String;)V

    .line 51
    invoke-virtual {v0}, Lcom/behance/sdk/BehanceSDKUserProfile;->getCompany()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;->setCompany(Ljava/lang/String;)V

    .line 52
    invoke-virtual {v0}, Lcom/behance/sdk/BehanceSDKUserProfile;->getWebsite()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;->setWebsite(Ljava/lang/String;)V

    .line 53
    invoke-virtual {v0}, Lcom/behance/sdk/BehanceSDKUserProfile;->getCountry()Lcom/behance/sdk/dto/location/BehanceSDKCountryDTO;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;->setCountry(Lcom/behance/sdk/dto/location/BehanceSDKCountryDTO;)V

    .line 54
    invoke-virtual {v0}, Lcom/behance/sdk/BehanceSDKUserProfile;->getState()Lcom/behance/sdk/dto/location/BehanceSDKStateDTO;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;->setState(Lcom/behance/sdk/dto/location/BehanceSDKStateDTO;)V

    .line 55
    invoke-virtual {v0}, Lcom/behance/sdk/BehanceSDKUserProfile;->getCity()Lcom/behance/sdk/dto/location/BehanceSDKCityDTO;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;->setCity(Lcom/behance/sdk/dto/location/BehanceSDKCityDTO;)V

    .line 56
    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;->setGetUserProfileTaskInProgress(Z)V

    .line 57
    invoke-virtual {v0}, Lcom/behance/sdk/BehanceSDKUserProfile;->getProfileImageUrl()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;->setOriginalImageUrl(Ljava/lang/String;)V

    .line 58
    iget-object v1, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;->callbacks:Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment$Callbacks;

    invoke-interface {v1}, Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment$Callbacks;->onGetUserProfileSuccess()V

    .line 59
    return-void
.end method

.method public saveUserPortfolioChanges()V
    .registers 7

    .prologue
    const/4 v4, 0x1

    .line 127
    iget-boolean v3, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;->editProfileTaskInProgress:Z

    if-nez v3, :cond_30

    iget-object v3, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;->editProfileAsyncTask:Lcom/behance/sdk/asynctasks/BehanceSDKEditProfileAsyncTask;

    if-nez v3, :cond_30

    .line 128
    invoke-virtual {p0, v4}, Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;->setEditProfileTaskInProgress(Z)V

    .line 129
    new-instance v3, Lcom/behance/sdk/asynctasks/BehanceSDKEditProfileAsyncTask;

    invoke-direct {v3, p0}, Lcom/behance/sdk/asynctasks/BehanceSDKEditProfileAsyncTask;-><init>(Lcom/behance/sdk/asynctask/listeners/IBehanceSDKEditProfileAsyncTaskListener;)V

    iput-object v3, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;->editProfileAsyncTask:Lcom/behance/sdk/asynctasks/BehanceSDKEditProfileAsyncTask;

    .line 130
    invoke-direct {p0}, Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;->applyParamChanges()Lcom/behance/sdk/asynctask/params/BehanceSDKEditProfileAsyncTaskParams;

    move-result-object v1

    .line 132
    .local v1, "params":Lcom/behance/sdk/asynctask/params/BehanceSDKEditProfileAsyncTaskParams;
    invoke-static {}, Lcom/behance/sdk/managers/BehanceSDKEditProfileManager;->getInstance()Lcom/behance/sdk/managers/BehanceSDKEditProfileManager;

    move-result-object v0

    .line 133
    .local v0, "manager":Lcom/behance/sdk/managers/BehanceSDKEditProfileManager;
    invoke-virtual {v0}, Lcom/behance/sdk/managers/BehanceSDKEditProfileManager;->getUserCredentials()Lcom/behance/sdk/IBehanceSDKUserCredentials;

    move-result-object v2

    .line 134
    .local v2, "userCredentials":Lcom/behance/sdk/IBehanceSDKUserCredentials;
    invoke-interface {v2}, Lcom/behance/sdk/IBehanceSDKUserCredentials;->getClientId()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Lcom/behance/sdk/asynctask/params/BehanceSDKEditProfileAsyncTaskParams;->setClientId(Ljava/lang/String;)V

    .line 136
    iget-object v3, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;->editProfileAsyncTask:Lcom/behance/sdk/asynctasks/BehanceSDKEditProfileAsyncTask;

    new-array v4, v4, [Lcom/behance/sdk/asynctask/params/BehanceSDKEditProfileAsyncTaskParams;

    const/4 v5, 0x0

    aput-object v1, v4, v5

    invoke-virtual {v3, v4}, Lcom/behance/sdk/asynctasks/BehanceSDKEditProfileAsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 138
    .end local v0    # "manager":Lcom/behance/sdk/managers/BehanceSDKEditProfileManager;
    .end local v1    # "params":Lcom/behance/sdk/asynctask/params/BehanceSDKEditProfileAsyncTaskParams;
    .end local v2    # "userCredentials":Lcom/behance/sdk/IBehanceSDKUserCredentials;
    :cond_30
    return-void
.end method

.method public setCallbacks(Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment$Callbacks;)V
    .registers 2
    .param p1, "callbacks"    # Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment$Callbacks;

    .prologue
    .line 103
    iput-object p1, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;->callbacks:Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment$Callbacks;

    .line 104
    return-void
.end method

.method public setCity(Lcom/behance/sdk/dto/location/BehanceSDKCityDTO;)V
    .registers 2
    .param p1, "city"    # Lcom/behance/sdk/dto/location/BehanceSDKCityDTO;

    .prologue
    .line 237
    iput-object p1, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;->city:Lcom/behance/sdk/dto/location/BehanceSDKCityDTO;

    .line 238
    return-void
.end method

.method public setCompany(Ljava/lang/String;)V
    .registers 2
    .param p1, "company"    # Ljava/lang/String;

    .prologue
    .line 205
    iput-object p1, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;->company:Ljava/lang/String;

    .line 206
    return-void
.end method

.method public setCountry(Lcom/behance/sdk/dto/location/BehanceSDKCountryDTO;)V
    .registers 2
    .param p1, "country"    # Lcom/behance/sdk/dto/location/BehanceSDKCountryDTO;

    .prologue
    .line 221
    iput-object p1, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;->country:Lcom/behance/sdk/dto/location/BehanceSDKCountryDTO;

    .line 222
    return-void
.end method

.method public setEditProfileTaskInProgress(Z)V
    .registers 2
    .param p1, "editProfileTaskInProgress"    # Z

    .prologue
    .line 123
    iput-boolean p1, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;->editProfileTaskInProgress:Z

    .line 124
    return-void
.end method

.method public setFirstName(Ljava/lang/String;)V
    .registers 2
    .param p1, "firstName"    # Ljava/lang/String;

    .prologue
    .line 181
    iput-object p1, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;->firstName:Ljava/lang/String;

    .line 182
    return-void
.end method

.method public setGetUserProfileTaskInProgress(Z)V
    .registers 2
    .param p1, "getUserProfileTaskInProgress"    # Z

    .prologue
    .line 115
    iput-boolean p1, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;->getUserProfileTaskInProgress:Z

    .line 116
    return-void
.end method

.method public setImage(Lcom/behance/sdk/project/modules/ImageModule;)V
    .registers 2
    .param p1, "image"    # Lcom/behance/sdk/project/modules/ImageModule;

    .prologue
    .line 245
    iput-object p1, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;->imageModule:Lcom/behance/sdk/project/modules/ImageModule;

    .line 246
    return-void
.end method

.method public setImageBitmap(Landroid/graphics/Bitmap;)V
    .registers 2
    .param p1, "imageBitmap"    # Landroid/graphics/Bitmap;

    .prologue
    .line 88
    iput-object p1, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;->imageBitmap:Landroid/graphics/Bitmap;

    .line 89
    return-void
.end method

.method public setLastName(Ljava/lang/String;)V
    .registers 2
    .param p1, "lastName"    # Ljava/lang/String;

    .prologue
    .line 189
    iput-object p1, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;->lastName:Ljava/lang/String;

    .line 190
    return-void
.end method

.method public setOccupation(Ljava/lang/String;)V
    .registers 2
    .param p1, "occupation"    # Ljava/lang/String;

    .prologue
    .line 197
    iput-object p1, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;->occupation:Ljava/lang/String;

    .line 198
    return-void
.end method

.method public setOriginalImageUrl(Ljava/lang/String;)V
    .registers 2
    .param p1, "originalImageUrl"    # Ljava/lang/String;

    .prologue
    .line 84
    iput-object p1, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;->originalImageUrl:Ljava/lang/String;

    .line 85
    return-void
.end method

.method public setState(Lcom/behance/sdk/dto/location/BehanceSDKStateDTO;)V
    .registers 2
    .param p1, "state"    # Lcom/behance/sdk/dto/location/BehanceSDKStateDTO;

    .prologue
    .line 229
    iput-object p1, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;->state:Lcom/behance/sdk/dto/location/BehanceSDKStateDTO;

    .line 230
    return-void
.end method

.method public setWebsite(Ljava/lang/String;)V
    .registers 2
    .param p1, "website"    # Ljava/lang/String;

    .prologue
    .line 213
    iput-object p1, p0, Lcom/behance/sdk/fragments/headless/BehanceSDKEditProfileHeadlessFragment;->website:Ljava/lang/String;

    .line 214
    return-void
.end method
