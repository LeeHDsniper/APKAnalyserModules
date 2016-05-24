.class public Lcom/adobe/creativesdk/foundation/auth/AdobeAuthSessionLauncher;
.super Ljava/lang/Object;
.source "AdobeAuthSessionLauncher.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/foundation/auth/AdobeAuthSessionLauncher$1;,
        Lcom/adobe/creativesdk/foundation/auth/AdobeAuthSessionLauncher$Builder;
    }
.end annotation


# instance fields
.field private _defaultIntentFlags:I

.field private _launcherActivity:Landroid/app/Activity;

.field private _launcherContext:Landroid/content/Context;

.field private _requestCode:I


# direct methods
.method private constructor <init>()V
    .registers 2

    .prologue
    const/4 v0, 0x0

    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthSessionLauncher;->_launcherActivity:Landroid/app/Activity;

    .line 17
    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthSessionLauncher;->_launcherContext:Landroid/content/Context;

    .line 18
    const/16 v0, 0x7d2

    iput v0, p0, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthSessionLauncher;->_requestCode:I

    .line 19
    const/4 v0, 0x0

    iput v0, p0, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthSessionLauncher;->_defaultIntentFlags:I

    .line 22
    return-void
.end method

.method synthetic constructor <init>(Lcom/adobe/creativesdk/foundation/auth/AdobeAuthSessionLauncher$1;)V
    .registers 2
    .param p1, "x0"    # Lcom/adobe/creativesdk/foundation/auth/AdobeAuthSessionLauncher$1;

    .prologue
    .line 15
    invoke-direct {p0}, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthSessionLauncher;-><init>()V

    return-void
.end method

.method static synthetic access$102(Lcom/adobe/creativesdk/foundation/auth/AdobeAuthSessionLauncher;I)I
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/auth/AdobeAuthSessionLauncher;
    .param p1, "x1"    # I

    .prologue
    .line 15
    iput p1, p0, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthSessionLauncher;->_defaultIntentFlags:I

    return p1
.end method

.method static synthetic access$202(Lcom/adobe/creativesdk/foundation/auth/AdobeAuthSessionLauncher;I)I
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/auth/AdobeAuthSessionLauncher;
    .param p1, "x1"    # I

    .prologue
    .line 15
    iput p1, p0, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthSessionLauncher;->_requestCode:I

    return p1
.end method

.method static synthetic access$302(Lcom/adobe/creativesdk/foundation/auth/AdobeAuthSessionLauncher;Landroid/app/Activity;)Landroid/app/Activity;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/auth/AdobeAuthSessionLauncher;
    .param p1, "x1"    # Landroid/app/Activity;

    .prologue
    .line 15
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthSessionLauncher;->_launcherActivity:Landroid/app/Activity;

    return-object p1
.end method

.method static synthetic access$402(Lcom/adobe/creativesdk/foundation/auth/AdobeAuthSessionLauncher;Landroid/content/Context;)Landroid/content/Context;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/foundation/auth/AdobeAuthSessionLauncher;
    .param p1, "x1"    # Landroid/content/Context;

    .prologue
    .line 15
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthSessionLauncher;->_launcherContext:Landroid/content/Context;

    return-object p1
.end method


# virtual methods
.method public getIntentFlags()I
    .registers 2

    .prologue
    .line 141
    iget v0, p0, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthSessionLauncher;->_defaultIntentFlags:I

    return v0
.end method

.method public getLauncherActivity()Landroid/content/Context;
    .registers 2

    .prologue
    .line 120
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthSessionLauncher;->_launcherActivity:Landroid/app/Activity;

    return-object v0
.end method

.method public getLauncherContext()Landroid/content/Context;
    .registers 2

    .prologue
    .line 127
    iget-object v0, p0, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthSessionLauncher;->_launcherContext:Landroid/content/Context;

    return-object v0
.end method

.method public getRequestCode()I
    .registers 2

    .prologue
    .line 134
    iget v0, p0, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthSessionLauncher;->_requestCode:I

    return v0
.end method
