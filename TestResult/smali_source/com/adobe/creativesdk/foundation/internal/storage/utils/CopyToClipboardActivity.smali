.class public Lcom/adobe/creativesdk/foundation/internal/storage/utils/CopyToClipboardActivity;
.super Landroid/app/Activity;
.source "CopyToClipboardActivity.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 9
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .registers 6
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 14
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 16
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/utils/CopyToClipboardActivity;->getIntent()Landroid/content/Intent;

    move-result-object v2

    const-string v3, "android.intent.extra.TEXT"

    invoke-virtual {v2, v3}, Landroid/content/Intent;->getCharSequenceExtra(Ljava/lang/String;)Ljava/lang/CharSequence;

    move-result-object v1

    .line 17
    .local v1, "text":Ljava/lang/CharSequence;
    const-string v2, "clipboard"

    invoke-virtual {p0, v2}, Lcom/adobe/creativesdk/foundation/internal/storage/utils/CopyToClipboardActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/ClipboardManager;

    .line 18
    .local v0, "clipboardManager":Landroid/content/ClipboardManager;
    const/4 v2, 0x0

    invoke-static {v2, v1}, Landroid/content/ClipData;->newPlainText(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Landroid/content/ClipData;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/content/ClipboardManager;->setPrimaryClip(Landroid/content/ClipData;)V

    .line 19
    invoke-virtual {p0}, Lcom/adobe/creativesdk/foundation/internal/storage/utils/CopyToClipboardActivity;->finish()V

    .line 20
    return-void
.end method
