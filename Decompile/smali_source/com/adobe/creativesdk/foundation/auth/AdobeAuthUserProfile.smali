.class public Lcom/adobe/creativesdk/foundation/auth/AdobeAuthUserProfile;
.super Ljava/lang/Object;
.source "AdobeAuthUserProfile.java"

# interfaces
.implements Ljava/io/Serializable;


# instance fields
.field protected adobeID:Ljava/lang/String;

.field protected description:Ljava/lang/String;

.field protected displayName:Ljava/lang/String;

.field protected email:Ljava/lang/String;

.field protected emailVerified:Z

.field protected firstName:Ljava/lang/String;

.field protected isEnterprise:Z

.field protected lastName:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    const/4 v0, 0x0

    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthUserProfile;->adobeID:Ljava/lang/String;

    .line 34
    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthUserProfile;->displayName:Ljava/lang/String;

    .line 35
    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthUserProfile;->firstName:Ljava/lang/String;

    .line 36
    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthUserProfile;->lastName:Ljava/lang/String;

    .line 37
    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthUserProfile;->email:Ljava/lang/String;

    .line 38
    iput-boolean v1, p0, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthUserProfile;->emailVerified:Z

    .line 39
    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthUserProfile;->description:Ljava/lang/String;

    .line 43
    iput-boolean v1, p0, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthUserProfile;->isEnterprise:Z

    return-void
.end method


# virtual methods
.method public getAdobeID()Ljava/lang/String;
    .registers 2

    .prologue
    .line 51
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthUserProfile;->adobeID:Ljava/lang/String;

    return-object v0
.end method

.method public getDisplayName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 58
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthUserProfile;->displayName:Ljava/lang/String;

    return-object v0
.end method

.method public getEmail()Ljava/lang/String;
    .registers 2

    .prologue
    .line 79
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthUserProfile;->email:Ljava/lang/String;

    return-object v0
.end method

.method public isEnterpriseUser()Z
    .registers 2

    .prologue
    .line 100
    iget-boolean v0, p0, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthUserProfile;->isEnterprise:Z

    return v0
.end method
