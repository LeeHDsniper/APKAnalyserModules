.class public Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;
.super Ljava/lang/Object;
.source "BehanceSDKSocialAccountDTO.java"


# instance fields
.field private accountClientId:Ljava/lang/String;

.field private accountClientSecret:Ljava/lang/String;

.field private accountDisplayNameResourceId:I

.field private accountType:Lcom/behance/sdk/enums/BehanceSDKSocialAccountType;

.field private additionalData:Ljava/lang/String;

.field private sharingEnabledLastTime:Z

.field private userAuthToken:Ljava/lang/String;

.field private userAuthTokenExpiryTime:J

.field private userAuthenticated:Z

.field private userId:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getAccountClientId()Ljava/lang/String;
    .registers 2

    .prologue
    .line 42
    iget-object v0, p0, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;->accountClientId:Ljava/lang/String;

    return-object v0
.end method

.method public getAccountClientSecret()Ljava/lang/String;
    .registers 2

    .prologue
    .line 50
    iget-object v0, p0, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;->accountClientSecret:Ljava/lang/String;

    return-object v0
.end method

.method public getAccountDisplayNameResourceId()I
    .registers 2

    .prologue
    .line 66
    iget v0, p0, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;->accountDisplayNameResourceId:I

    return v0
.end method

.method public getAccountType()Lcom/behance/sdk/enums/BehanceSDKSocialAccountType;
    .registers 2

    .prologue
    .line 90
    iget-object v0, p0, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;->accountType:Lcom/behance/sdk/enums/BehanceSDKSocialAccountType;

    return-object v0
.end method

.method public getAdditionalData()Ljava/lang/String;
    .registers 2

    .prologue
    .line 98
    iget-object v0, p0, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;->additionalData:Ljava/lang/String;

    return-object v0
.end method

.method public getUserAuthToken()Ljava/lang/String;
    .registers 2

    .prologue
    .line 74
    iget-object v0, p0, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;->userAuthToken:Ljava/lang/String;

    return-object v0
.end method

.method public getUserAuthTokenExpiryTime()J
    .registers 3

    .prologue
    .line 82
    iget-wide v0, p0, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;->userAuthTokenExpiryTime:J

    return-wide v0
.end method

.method public getUserId()Ljava/lang/String;
    .registers 2

    .prologue
    .line 58
    iget-object v0, p0, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;->userId:Ljava/lang/String;

    return-object v0
.end method

.method public isSharingEnabledLastTime()Z
    .registers 2

    .prologue
    .line 106
    iget-boolean v0, p0, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;->sharingEnabledLastTime:Z

    return v0
.end method

.method public isUserAuthenticated()Z
    .registers 2

    .prologue
    .line 114
    iget-boolean v0, p0, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;->userAuthenticated:Z

    return v0
.end method

.method public setAccountClientId(Ljava/lang/String;)V
    .registers 2
    .param p1, "accountClientId"    # Ljava/lang/String;

    .prologue
    .line 46
    iput-object p1, p0, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;->accountClientId:Ljava/lang/String;

    .line 47
    return-void
.end method

.method public setAccountClientSecret(Ljava/lang/String;)V
    .registers 2
    .param p1, "accountClientSecret"    # Ljava/lang/String;

    .prologue
    .line 54
    iput-object p1, p0, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;->accountClientSecret:Ljava/lang/String;

    .line 55
    return-void
.end method

.method public setAccountDisplayNameResourceId(I)V
    .registers 2
    .param p1, "accountDisplayNameResourceId"    # I

    .prologue
    .line 70
    iput p1, p0, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;->accountDisplayNameResourceId:I

    .line 71
    return-void
.end method

.method public setAccountType(Lcom/behance/sdk/enums/BehanceSDKSocialAccountType;)V
    .registers 2
    .param p1, "accountType"    # Lcom/behance/sdk/enums/BehanceSDKSocialAccountType;

    .prologue
    .line 94
    iput-object p1, p0, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;->accountType:Lcom/behance/sdk/enums/BehanceSDKSocialAccountType;

    .line 95
    return-void
.end method

.method public setAdditionalData(Ljava/lang/String;)V
    .registers 2
    .param p1, "additionalData"    # Ljava/lang/String;

    .prologue
    .line 102
    iput-object p1, p0, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;->additionalData:Ljava/lang/String;

    .line 103
    return-void
.end method

.method public setSharingEnabledLastTime(Z)V
    .registers 2
    .param p1, "sharingEnabledLastTime"    # Z

    .prologue
    .line 110
    iput-boolean p1, p0, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;->sharingEnabledLastTime:Z

    .line 111
    return-void
.end method

.method public setUserAuthToken(Ljava/lang/String;)V
    .registers 2
    .param p1, "userAuthToken"    # Ljava/lang/String;

    .prologue
    .line 78
    iput-object p1, p0, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;->userAuthToken:Ljava/lang/String;

    .line 79
    return-void
.end method

.method public setUserAuthTokenExpiryTime(J)V
    .registers 4
    .param p1, "userAuthTokenExpiryTime"    # J

    .prologue
    .line 86
    iput-wide p1, p0, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;->userAuthTokenExpiryTime:J

    .line 87
    return-void
.end method

.method public setUserAuthenticated(Z)V
    .registers 2
    .param p1, "userAuthenticated"    # Z

    .prologue
    .line 118
    iput-boolean p1, p0, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;->userAuthenticated:Z

    .line 119
    return-void
.end method

.method public setUserId(Ljava/lang/String;)V
    .registers 2
    .param p1, "userId"    # Ljava/lang/String;

    .prologue
    .line 62
    iput-object p1, p0, Lcom/behance/sdk/dto/BehanceSDKSocialAccountDTO;->userId:Ljava/lang/String;

    .line 63
    return-void
.end method
