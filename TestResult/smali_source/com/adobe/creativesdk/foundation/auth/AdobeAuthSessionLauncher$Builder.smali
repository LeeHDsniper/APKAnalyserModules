.class public Lcom/adobe/creativesdk/foundation/auth/AdobeAuthSessionLauncher$Builder;
.super Ljava/lang/Object;
.source "AdobeAuthSessionLauncher.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/adobe/creativesdk/foundation/auth/AdobeAuthSessionLauncher;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field _defaultIntentFlags:I

.field _launcherActivity:Landroid/app/Activity;

.field _launcherContext:Landroid/content/Context;

.field _requestCode:I


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    const/4 v0, 0x0

    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthSessionLauncher$Builder;->_launcherActivity:Landroid/app/Activity;

    .line 44
    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthSessionLauncher$Builder;->_launcherContext:Landroid/content/Context;

    .line 45
    const/16 v0, 0x7d2

    iput v0, p0, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthSessionLauncher$Builder;->_requestCode:I

    .line 46
    const/4 v0, 0x0

    iput v0, p0, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthSessionLauncher$Builder;->_defaultIntentFlags:I

    .line 47
    return-void
.end method


# virtual methods
.method public build()Lcom/adobe/creativesdk/foundation/auth/AdobeAuthSessionLauncher;
    .registers 4

    .prologue
    .line 103
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthSessionLauncher$Builder;->_launcherContext:Landroid/content/Context;

    if-nez v1, :cond_10

    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthSessionLauncher$Builder;->_launcherActivity:Landroid/app/Activity;

    if-nez v1, :cond_10

    .line 104
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "activity or context must be defined"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 106
    :cond_10
    new-instance v0, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthSessionLauncher;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthSessionLauncher;-><init>(Lcom/adobe/creativesdk/foundation/auth/AdobeAuthSessionLauncher$1;)V

    .line 107
    .local v0, "instance":Lcom/adobe/creativesdk/foundation/auth/AdobeAuthSessionLauncher;
    iget v1, p0, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthSessionLauncher$Builder;->_defaultIntentFlags:I

    # setter for: Lcom/adobe/creativesdk/foundation/auth/AdobeAuthSessionLauncher;->_defaultIntentFlags:I
    invoke-static {v0, v1}, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthSessionLauncher;->access$102(Lcom/adobe/creativesdk/foundation/auth/AdobeAuthSessionLauncher;I)I

    .line 108
    iget v1, p0, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthSessionLauncher$Builder;->_requestCode:I

    # setter for: Lcom/adobe/creativesdk/foundation/auth/AdobeAuthSessionLauncher;->_requestCode:I
    invoke-static {v0, v1}, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthSessionLauncher;->access$202(Lcom/adobe/creativesdk/foundation/auth/AdobeAuthSessionLauncher;I)I

    .line 109
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthSessionLauncher$Builder;->_launcherActivity:Landroid/app/Activity;

    # setter for: Lcom/adobe/creativesdk/foundation/auth/AdobeAuthSessionLauncher;->_launcherActivity:Landroid/app/Activity;
    invoke-static {v0, v1}, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthSessionLauncher;->access$302(Lcom/adobe/creativesdk/foundation/auth/AdobeAuthSessionLauncher;Landroid/app/Activity;)Landroid/app/Activity;

    .line 110
    iget-object v1, p0, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthSessionLauncher$Builder;->_launcherContext:Landroid/content/Context;

    # setter for: Lcom/adobe/creativesdk/foundation/auth/AdobeAuthSessionLauncher;->_launcherContext:Landroid/content/Context;
    invoke-static {v0, v1}, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthSessionLauncher;->access$402(Lcom/adobe/creativesdk/foundation/auth/AdobeAuthSessionLauncher;Landroid/content/Context;)Landroid/content/Context;

    .line 111
    return-object v0
.end method

.method public withActivity(Landroid/app/Activity;)Lcom/adobe/creativesdk/foundation/auth/AdobeAuthSessionLauncher$Builder;
    .registers 3
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 55
    iput-object p1, p0, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthSessionLauncher$Builder;->_launcherActivity:Landroid/app/Activity;

    .line 56
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthSessionLauncher$Builder;->_launcherContext:Landroid/content/Context;

    .line 57
    return-object p0
.end method

.method public withRequestCode(I)Lcom/adobe/creativesdk/foundation/auth/AdobeAuthSessionLauncher$Builder;
    .registers 2
    .param p1, "requestCode"    # I

    .prologue
    .line 83
    iput p1, p0, Lcom/adobe/creativesdk/foundation/auth/AdobeAuthSessionLauncher$Builder;->_requestCode:I

    .line 84
    return-object p0
.end method
