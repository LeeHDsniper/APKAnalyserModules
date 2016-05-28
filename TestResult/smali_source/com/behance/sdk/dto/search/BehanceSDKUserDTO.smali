.class public Lcom/behance/sdk/dto/search/BehanceSDKUserDTO;
.super Ljava/lang/Object;
.source "BehanceSDKUserDTO.java"


# instance fields
.field private appreciationsCount:I

.field private city:Ljava/lang/String;

.field private commentsCount:I

.field private company:Ljava/lang/String;

.field private country:Ljava/lang/String;

.field private createdOn:J

.field private detailsSections:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/behance/sdk/dto/search/BehanceSDKUserDetailsSectionDTO;",
            ">;"
        }
    .end annotation
.end field

.field private displayName:Ljava/lang/String;

.field private featuredDetails:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/behance/sdk/dto/search/BehanceSDKFeaturedDTO;",
            ">;"
        }
    .end annotation
.end field

.field private fields:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private firstName:Ljava/lang/String;

.field private followersCount:I

.field private followingCount:I

.field private id:I

.field private isCurrentUserFollowing:Z

.field private isEnterprise:Z

.field private lastName:Ljava/lang/String;

.field private occupation:Ljava/lang/String;

.field private profileImagesArray:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray",
            "<",
            "Lcom/behance/sdk/dto/search/BehanceSDKImageDTO;",
            ">;"
        }
    .end annotation
.end field

.field private profileUrl:Ljava/lang/String;

.field private state:Ljava/lang/String;

.field private twitterHandle:Ljava/lang/String;

.field private userName:Ljava/lang/String;

.field private viewsCount:I

.field private webLinks:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/behance/sdk/dto/search/BehanceSDKWebLinkDTO;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 81
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/behance/sdk/dto/search/BehanceSDKUserDTO;->isEnterprise:Z

    return-void
.end method


# virtual methods
.method public addDetailsSection(Lcom/behance/sdk/dto/search/BehanceSDKUserDetailsSectionDTO;)V
    .registers 3
    .param p1, "section"    # Lcom/behance/sdk/dto/search/BehanceSDKUserDetailsSectionDTO;

    .prologue
    .line 408
    iget-object v0, p0, Lcom/behance/sdk/dto/search/BehanceSDKUserDTO;->detailsSections:Ljava/util/List;

    if-nez v0, :cond_b

    .line 409
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/behance/sdk/dto/search/BehanceSDKUserDTO;->detailsSections:Ljava/util/List;

    .line 411
    :cond_b
    iget-object v0, p0, Lcom/behance/sdk/dto/search/BehanceSDKUserDTO;->detailsSections:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 412
    return-void
.end method

.method public addFeaturedDetail(Lcom/behance/sdk/dto/search/BehanceSDKFeaturedDTO;)V
    .registers 3
    .param p1, "feature"    # Lcom/behance/sdk/dto/search/BehanceSDKFeaturedDTO;

    .prologue
    .line 278
    iget-object v0, p0, Lcom/behance/sdk/dto/search/BehanceSDKUserDTO;->featuredDetails:Ljava/util/List;

    if-nez v0, :cond_b

    .line 279
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/behance/sdk/dto/search/BehanceSDKUserDTO;->featuredDetails:Ljava/util/List;

    .line 281
    :cond_b
    iget-object v0, p0, Lcom/behance/sdk/dto/search/BehanceSDKUserDTO;->featuredDetails:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 282
    return-void
.end method

.method public addField(Ljava/lang/String;)V
    .registers 4
    .param p1, "fieldStr"    # Ljava/lang/String;

    .prologue
    .line 166
    iget-object v0, p0, Lcom/behance/sdk/dto/search/BehanceSDKUserDTO;->fields:Ljava/util/List;

    if-nez v0, :cond_c

    .line 167
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lcom/behance/sdk/dto/search/BehanceSDKUserDTO;->fields:Ljava/util/List;

    .line 169
    :cond_c
    iget-object v0, p0, Lcom/behance/sdk/dto/search/BehanceSDKUserDTO;->fields:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 170
    return-void
.end method

.method public addImage(ILjava/lang/String;)V
    .registers 5
    .param p1, "key"    # I
    .param p2, "url"    # Ljava/lang/String;

    .prologue
    .line 180
    iget-object v0, p0, Lcom/behance/sdk/dto/search/BehanceSDKUserDTO;->profileImagesArray:Landroid/util/SparseArray;

    if-nez v0, :cond_c

    .line 181
    new-instance v0, Landroid/util/SparseArray;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Landroid/util/SparseArray;-><init>(I)V

    iput-object v0, p0, Lcom/behance/sdk/dto/search/BehanceSDKUserDTO;->profileImagesArray:Landroid/util/SparseArray;

    .line 183
    :cond_c
    iget-object v0, p0, Lcom/behance/sdk/dto/search/BehanceSDKUserDTO;->profileImagesArray:Landroid/util/SparseArray;

    invoke-static {p2}, Lcom/behance/sdk/dto/search/BehanceSDKImageDTO;->getNewInstance(Ljava/lang/String;)Lcom/behance/sdk/dto/search/BehanceSDKImageDTO;

    move-result-object v1

    invoke-virtual {v0, p1, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 184
    return-void
.end method

.method public addWebLink(Lcom/behance/sdk/dto/search/BehanceSDKWebLinkDTO;)V
    .registers 3
    .param p1, "webLink"    # Lcom/behance/sdk/dto/search/BehanceSDKWebLinkDTO;

    .prologue
    .line 389
    iget-object v0, p0, Lcom/behance/sdk/dto/search/BehanceSDKUserDTO;->webLinks:Ljava/util/List;

    if-nez v0, :cond_b

    .line 390
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/behance/sdk/dto/search/BehanceSDKUserDTO;->webLinks:Ljava/util/List;

    .line 392
    :cond_b
    iget-object v0, p0, Lcom/behance/sdk/dto/search/BehanceSDKUserDTO;->webLinks:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 393
    return-void
.end method

.method public setAppreciationsCount(I)V
    .registers 2
    .param p1, "appreciationsCount"    # I

    .prologue
    .line 341
    iput p1, p0, Lcom/behance/sdk/dto/search/BehanceSDKUserDTO;->appreciationsCount:I

    .line 342
    return-void
.end method

.method public setCity(Ljava/lang/String;)V
    .registers 2
    .param p1, "city"    # Ljava/lang/String;

    .prologue
    .line 219
    iput-object p1, p0, Lcom/behance/sdk/dto/search/BehanceSDKUserDTO;->city:Ljava/lang/String;

    .line 220
    return-void
.end method

.method public setCommentsCount(I)V
    .registers 2
    .param p1, "commentsCount"    # I

    .prologue
    .line 349
    iput p1, p0, Lcom/behance/sdk/dto/search/BehanceSDKUserDTO;->commentsCount:I

    .line 350
    return-void
.end method

.method public setCompany(Ljava/lang/String;)V
    .registers 2
    .param p1, "company"    # Ljava/lang/String;

    .prologue
    .line 243
    iput-object p1, p0, Lcom/behance/sdk/dto/search/BehanceSDKUserDTO;->company:Ljava/lang/String;

    .line 244
    return-void
.end method

.method public setCountry(Ljava/lang/String;)V
    .registers 2
    .param p1, "country"    # Ljava/lang/String;

    .prologue
    .line 235
    iput-object p1, p0, Lcom/behance/sdk/dto/search/BehanceSDKUserDTO;->country:Ljava/lang/String;

    .line 236
    return-void
.end method

.method public setCreatedOn(J)V
    .registers 4
    .param p1, "createdOn"    # J

    .prologue
    .line 259
    iput-wide p1, p0, Lcom/behance/sdk/dto/search/BehanceSDKUserDTO;->createdOn:J

    .line 260
    return-void
.end method

.method public setCurrentUserFollowing(Z)V
    .registers 2
    .param p1, "isCurrentUserFollowing"    # Z

    .prologue
    .line 365
    iput-boolean p1, p0, Lcom/behance/sdk/dto/search/BehanceSDKUserDTO;->isCurrentUserFollowing:Z

    .line 366
    return-void
.end method

.method public setDisplayName(Ljava/lang/String;)V
    .registers 2
    .param p1, "displayName"    # Ljava/lang/String;

    .prologue
    .line 124
    iput-object p1, p0, Lcom/behance/sdk/dto/search/BehanceSDKUserDTO;->displayName:Ljava/lang/String;

    .line 125
    return-void
.end method

.method public setFirstName(Ljava/lang/String;)V
    .registers 2
    .param p1, "firstName"    # Ljava/lang/String;

    .prologue
    .line 88
    iput-object p1, p0, Lcom/behance/sdk/dto/search/BehanceSDKUserDTO;->firstName:Ljava/lang/String;

    .line 89
    return-void
.end method

.method public setFollowersCount(I)V
    .registers 2
    .param p1, "followersCount"    # I

    .prologue
    .line 333
    iput p1, p0, Lcom/behance/sdk/dto/search/BehanceSDKUserDTO;->followersCount:I

    .line 334
    return-void
.end method

.method public setFollowingCount(I)V
    .registers 2
    .param p1, "followingCount"    # I

    .prologue
    .line 325
    iput p1, p0, Lcom/behance/sdk/dto/search/BehanceSDKUserDTO;->followingCount:I

    .line 326
    return-void
.end method

.method public setId(I)V
    .registers 2
    .param p1, "id"    # I

    .prologue
    .line 104
    iput p1, p0, Lcom/behance/sdk/dto/search/BehanceSDKUserDTO;->id:I

    .line 105
    return-void
.end method

.method public setLastName(Ljava/lang/String;)V
    .registers 2
    .param p1, "lastName"    # Ljava/lang/String;

    .prologue
    .line 96
    iput-object p1, p0, Lcom/behance/sdk/dto/search/BehanceSDKUserDTO;->lastName:Ljava/lang/String;

    .line 97
    return-void
.end method

.method public setOccupation(Ljava/lang/String;)V
    .registers 2
    .param p1, "occupation"    # Ljava/lang/String;

    .prologue
    .line 251
    iput-object p1, p0, Lcom/behance/sdk/dto/search/BehanceSDKUserDTO;->occupation:Ljava/lang/String;

    .line 252
    return-void
.end method

.method public setProfileUrl(Ljava/lang/String;)V
    .registers 2
    .param p1, "profileUrl"    # Ljava/lang/String;

    .prologue
    .line 112
    iput-object p1, p0, Lcom/behance/sdk/dto/search/BehanceSDKUserDTO;->profileUrl:Ljava/lang/String;

    .line 113
    return-void
.end method

.method public setState(Ljava/lang/String;)V
    .registers 2
    .param p1, "state"    # Ljava/lang/String;

    .prologue
    .line 227
    iput-object p1, p0, Lcom/behance/sdk/dto/search/BehanceSDKUserDTO;->state:Ljava/lang/String;

    .line 228
    return-void
.end method

.method public setTwitterHandle(Ljava/lang/String;)V
    .registers 2
    .param p1, "twitterHandle"    # Ljava/lang/String;

    .prologue
    .line 373
    iput-object p1, p0, Lcom/behance/sdk/dto/search/BehanceSDKUserDTO;->twitterHandle:Ljava/lang/String;

    .line 374
    return-void
.end method

.method public setUserName(Ljava/lang/String;)V
    .registers 2
    .param p1, "userName"    # Ljava/lang/String;

    .prologue
    .line 132
    iput-object p1, p0, Lcom/behance/sdk/dto/search/BehanceSDKUserDTO;->userName:Ljava/lang/String;

    .line 133
    return-void
.end method

.method public setViewsCount(I)V
    .registers 2
    .param p1, "viewsCount"    # I

    .prologue
    .line 357
    iput p1, p0, Lcom/behance/sdk/dto/search/BehanceSDKUserDTO;->viewsCount:I

    .line 358
    return-void
.end method
