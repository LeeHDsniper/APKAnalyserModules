.class public final Lcom/adobe/creativesdk/foundation/auth/AdobeUXAuthManager;
.super Ljava/lang/Object;
.source "AdobeUXAuthManager.java"


# static fields
.field private static sharedInstance:Lcom/adobe/creativesdk/foundation/auth/AdobeUXAuthManager;


# instance fields
.field private _authManagerRestricted:Lcom/adobe/creativesdk/foundation/adobeinternal/auth/AdobeUXAuthManagerRestricted;

.field private _currentRequestCode:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 44
    const/4 v0, 0x0

    sput-object v0, Lcom/adobe/creativesdk/foundation/auth/AdobeUXAuthManager;->sharedInstance:Lcom/adobe/creativesdk/foundation/auth/AdobeUXAuthManager;

    return-void
.end method

.method private constructor <init>()V
    .registers 2

    .prologue
    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 45
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/auth/AdobeUXAuthManager;->_authManagerRestricted:Lcom/adobe/creativesdk/foundation/adobeinternal/auth/AdobeUXAuthManagerRestricted;

    .line 46
    const/4 v0, -0x1

    iput v0, p0, Lcom/adobe/creativesdk/foundation/auth/AdobeUXAuthManager;->_currentRequestCode:I

    .line 51
    invoke-static {}, Lcom/adobe/creativesdk/foundation/adobeinternal/auth/AdobeUXAuthManagerRestricted;->getSharedAuthManagerRestricted()Lcom/adobe/creativesdk/foundation/adobeinternal/auth/AdobeUXAuthManagerRestricted;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/auth/AdobeUXAuthManager;->_authManagerRestricted:Lcom/adobe/creativesdk/foundation/adobeinternal/auth/AdobeUXAuthManagerRestricted;

    .line 52
    return-void
.end method

.method public static getSharedAuthManager()Lcom/adobe/creativesdk/foundation/auth/AdobeUXAuthManager;
    .registers 1

    .prologue
    .line 60
    sget-object v0, Lcom/adobe/creativesdk/foundation/auth/AdobeUXAuthManager;->sharedInstance:Lcom/adobe/creativesdk/foundation/auth/AdobeUXAuthManager;

    if-nez v0, :cond_b

    .line 62
    new-instance v0, Lcom/adobe/creativesdk/foundation/auth/AdobeUXAuthManager;

    invoke-direct {v0}, Lcom/adobe/creativesdk/foundation/auth/AdobeUXAuthManager;-><init>()V

    sput-object v0, Lcom/adobe/creativesdk/foundation/auth/AdobeUXAuthManager;->sharedInstance:Lcom/adobe/creativesdk/foundation/auth/AdobeUXAuthManager;

    .line 64
    :cond_b
    sget-object v0, Lcom/adobe/creativesdk/foundation/auth/AdobeUXAuthManager;->sharedInstance:Lcom/adobe/creativesdk/foundation/auth/AdobeUXAuthManager;

    return-object v0
.end method


# virtual methods
.method public getUserProfile()Lcom/adobe/creativesdk/foundation/auth/AdobeAuthUserProfile;
    .registers 2

    .prologue
    .line 95
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/auth/AdobeUXAuthManager;->_authManagerRestricted:Lcom/adobe/creativesdk/foundation/adobeinternal/auth/AdobeUXAuthManagerRestricted;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/adobeinternal/auth/AdobeUXAuthManagerRestricted;->getUserProfile()Lcom/adobe/creativesdk/foundation/auth/AdobeAuthUserProfile;

    move-result-object v0

    return-object v0
.end method

.method public isAuthenticated()Z
    .registers 2

    .prologue
    .line 105
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/auth/AdobeUXAuthManager;->_authManagerRestricted:Lcom/adobe/creativesdk/foundation/adobeinternal/auth/AdobeUXAuthManagerRestricted;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/foundation/adobeinternal/auth/AdobeUXAuthManagerRestricted;->isAuthenticated()Z

    move-result v0

    return v0
.end method
