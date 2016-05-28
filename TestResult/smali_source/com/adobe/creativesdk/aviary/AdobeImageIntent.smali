.class public final Lcom/adobe/creativesdk/aviary/AdobeImageIntent;
.super Ljava/lang/Object;
.source "AdobeImageIntent.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/aviary/AdobeImageIntent$Builder;,
        Lcom/adobe/creativesdk/aviary/AdobeImageIntent$SourceType;
    }
.end annotation


# static fields
.field public static final ACTION_CDS_DOWNLOAD_EXTRA_ASSETS:Ljava/lang/String; = "aviary.intent.action.CDS_DOWNLOAD_EXTRA_ASSETS"

.field public static final ACTION_CDS_DOWNLOAD_START:Ljava/lang/String; = "aviary.intent.action.CDS_DOWNLOAD_START"

.field public static final ACTION_CDS_RESTORE_OWNED_PACKS:Ljava/lang/String; = "aviary.intent.action.CDS_RESTORE_OWNED_PACKS"

.field public static final ACTION_CDS_RESTORE_USER_ITEMS:Ljava/lang/String; = "aviary.intent.action.CDS_RESTORE_USER_ITEMS"

.field public static final ACTION_EDIT:Ljava/lang/String; = "aviary.intent.action.EDIT"

.field public static final ACTION_MESSAGE:Ljava/lang/String; = "aviary.intent.ACTION_MESSAGE"

.field public static final EXTRA_ACCENT_COLOR:Ljava/lang/String; = "extra-accent-color"

.field public static final EXTRA_APP_ID:Ljava/lang/String; = "app-id"

.field public static final EXTRA_ENABLE_AUTO_ACCENT_COLOR:Ljava/lang/String; = "extra-enable-auto-accent-color"

.field public static final EXTRA_HIDE_EXIT_UNSAVE_CONFIRMATION:Ljava/lang/String; = "hide-exit-unsave-confirmation"

.field public static final EXTRA_IN_EXTRAS:Ljava/lang/String; = "extra-in-extras"

.field public static final EXTRA_IN_HIRES_MEGAPIXELS:Ljava/lang/String; = "output-hires-megapixels"

.field public static final EXTRA_IN_PREVIEW_MAX_SIZE:Ljava/lang/String; = "max-image-size"

.field public static final EXTRA_IN_SAVE_ON_NO_CHANGES:Ljava/lang/String; = "save-on-no-changes"

.field public static final EXTRA_IN_SOURCE_TYPE:Ljava/lang/String; = "source-type"

.field public static final EXTRA_OUTPUT:Ljava/lang/String; = "output"

.field public static final EXTRA_OUTPUT_FORMAT:Ljava/lang/String; = "output-format"

.field public static final EXTRA_OUTPUT_QUALITY:Ljava/lang/String; = "output-quality"

.field public static final EXTRA_OUTPUT_URI:Ljava/lang/String; = "extra-output-uri"

.field public static final EXTRA_OUT_BITMAP_CHANGED:Ljava/lang/String; = "bitmap-changed"

.field public static final EXTRA_QUICK_LAUNCH_TOOL:Ljava/lang/String; = "extra-in-quick-tool"

.field public static final EXTRA_QUICK_LAUNCH_TOOL_OPTIONS:Ljava/lang/String; = "extra-in-quick-tool-options"

.field public static final EXTRA_RETURN_DATA:Ljava/lang/String; = "return-data"

.field public static final EXTRA_TOOLS_DISABLE_VIBRATION:Ljava/lang/String; = "tools-vibration-disabled"

.field public static final EXTRA_TOOLS_LIST:Ljava/lang/String; = "tools-list"


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 459
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static createAccountManagerIntent(Landroid/content/Context;)Landroid/content/Intent;
    .registers 3
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 423
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/adobe/creativesdk/aviary/AdobeImageBillingService;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    return-object v0
.end method

.method public static createCdsInitIntent(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;
    .registers 4
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "reason"    # Ljava/lang/String;

    .prologue
    .line 416
    new-instance v0, Landroid/content/Intent;

    const-string v1, "aviary.intent.action.CDS_DOWNLOAD_START"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 417
    .local v0, "intent":Landroid/content/Intent;
    invoke-static {p0}, Lcom/adobe/creativesdk/aviary/AdobeImageIntent;->getCdsServiceComponent(Landroid/content/Context;)Landroid/content/ComponentName;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 418
    const-string v1, "extra-reason"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 419
    return-object v0
.end method

.method public static createCdsRestoreAllIntent(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;
    .registers 5
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "packType"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    .line 430
    new-instance v0, Landroid/content/Intent;

    const-string v1, "aviary.intent.action.CDS_RESTORE_USER_ITEMS"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 431
    .local v0, "intent":Landroid/content/Intent;
    invoke-static {p0}, Lcom/adobe/creativesdk/aviary/AdobeImageIntent;->getCdsServiceComponent(Landroid/content/Context;)Landroid/content/ComponentName;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 432
    const-string v1, "extra-lazy-execution"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 433
    const-string v1, "extra-execute-wifi-only"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 434
    const-string v1, "extra-execute-plugged-only"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 435
    const-string v1, "extra-pack-type"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 436
    const-string v1, "extra-reason"

    const-string v2, "restore-all"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 437
    return-object v0
.end method

.method public static createCdsRestoreOwnedPacks(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;
    .registers 5
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "packType"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    .line 442
    new-instance v0, Landroid/content/Intent;

    const-string v1, "aviary.intent.action.CDS_RESTORE_OWNED_PACKS"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 443
    .local v0, "intent":Landroid/content/Intent;
    invoke-static {p0}, Lcom/adobe/creativesdk/aviary/AdobeImageIntent;->getCdsServiceComponent(Landroid/content/Context;)Landroid/content/ComponentName;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 444
    const-string v1, "extra-pack-type"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 445
    const-string v1, "extra-lazy-execution"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 446
    const-string v1, "extra-execute-wifi-only"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 447
    const-string v1, "extra-execute-plugged-only"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 448
    const-string v1, "extra-reason"

    const-string v2, "restore-owned-packs"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 449
    return-object v0
.end method

.method public static createCommonIntent(Landroid/content/Context;Ljava/lang/String;Ljava/lang/Class;)Landroid/content/Intent;
    .registers 5
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "action"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/lang/String;",
            "Ljava/lang/Class",
            "<*>;)",
            "Landroid/content/Intent;"
        }
    .end annotation

    .prologue
    .line 453
    .local p2, "cls":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1, p1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 454
    .local v1, "intent":Landroid/content/Intent;
    new-instance v0, Landroid/content/ComponentName;

    invoke-direct {v0, p0, p2}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 455
    .local v0, "cname":Landroid/content/ComponentName;
    invoke-virtual {v1, v0}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 456
    return-object v1
.end method

.method private static getAccountServiceComponent(Landroid/content/Context;)Landroid/content/ComponentName;
    .registers 3
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 406
    new-instance v0, Landroid/content/ComponentName;

    const-string v1, "com.adobe.creativesdk.aviary.internal.creativesdk.AdobeAccountRemoteService"

    invoke-direct {v0, p0, v1}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    return-object v0
.end method

.method private static getCdsServiceComponent(Landroid/content/Context;)Landroid/content/ComponentName;
    .registers 3
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 402
    new-instance v0, Landroid/content/ComponentName;

    const-class v1, Lcom/adobe/creativesdk/aviary/internal/cds/CdsService;

    invoke-direct {v0, p0, v1}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    return-object v0
.end method

.method public static getLogsCollectorComponent(Landroid/content/Context;)Landroid/content/ComponentName;
    .registers 5
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 396
    new-instance v0, Landroid/content/ComponentName;

    .line 397
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 398
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ".services.LogsCollectorService"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method
