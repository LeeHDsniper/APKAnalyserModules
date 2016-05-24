.class public Lcom/adobe/creativesdk/aviary/internal/MonitoredActivity;
.super Lcom/adobe/creativesdk/aviary/ToolBarActivity;
.source "MonitoredActivity.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/aviary/internal/MonitoredActivity$LifeCycleListener;
    }
.end annotation


# instance fields
.field private mBroadcastReceiver:Landroid/content/BroadcastReceiver;

.field private mDestroy:Z

.field private final mListeners:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/adobe/creativesdk/aviary/internal/MonitoredActivity$LifeCycleListener;",
            ">;"
        }
    .end annotation
.end field

.field private mReceiptManager:Lcom/adobe/creativesdk/aviary/internal/receipt/IReceiptManager;

.field protected mTracker:Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 27
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/ToolBarActivity;-><init>()V

    .line 30
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/MonitoredActivity;->mListeners:Ljava/util/ArrayList;

    .line 91
    return-void
.end method

.method static synthetic access$000(Lcom/adobe/creativesdk/aviary/internal/MonitoredActivity;)V
    .registers 1
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/internal/MonitoredActivity;

    .prologue
    .line 27
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/internal/MonitoredActivity;->initializeBroadcastReceivers()V

    return-void
.end method

.method static synthetic access$100(Lcom/adobe/creativesdk/aviary/internal/MonitoredActivity;)V
    .registers 1
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/internal/MonitoredActivity;

    .prologue
    .line 27
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/internal/MonitoredActivity;->initializeCDS()V

    return-void
.end method

.method static synthetic access$200(Lcom/adobe/creativesdk/aviary/internal/MonitoredActivity;)V
    .registers 1
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/internal/MonitoredActivity;

    .prologue
    .line 27
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/internal/MonitoredActivity;->onKill()V

    return-void
.end method

.method static synthetic access$300(Lcom/adobe/creativesdk/aviary/internal/MonitoredActivity;Landroid/content/Intent;)V
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/internal/MonitoredActivity;
    .param p1, "x1"    # Landroid/content/Intent;

    .prologue
    .line 27
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/aviary/internal/MonitoredActivity;->onAlertMessageReceived(Landroid/content/Intent;)V

    return-void
.end method

.method private generateAlertDialog(Landroid/os/Bundle;)Landroid/app/AlertDialog;
    .registers 10
    .param p1, "extras"    # Landroid/os/Bundle;

    .prologue
    const/4 v5, 0x0

    .line 206
    const-string v6, "MonitoredActivity"

    const-string v7, "generateAlertDialog"

    invoke-static {v6, v7}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 208
    if-nez p1, :cond_b

    .line 245
    :cond_a
    :goto_a
    return-object v5

    .line 212
    :cond_b
    const-string v6, "android.intent.extra.TITLE"

    invoke-virtual {p1, v6}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 213
    .local v4, "title":Ljava/lang/String;
    const-string v6, "extra-exceptions"

    invoke-virtual {p1, v6}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v1

    .line 215
    .local v1, "exceptions":Ljava/io/Serializable;
    if-eqz v4, :cond_a

    const-string v6, "extra-exceptions"

    invoke-virtual {p1, v6}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_29

    const-string v6, "android.intent.extra.TEXT"

    invoke-virtual {p1, v6}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_a

    .line 216
    :cond_29
    const/4 v2, 0x0

    .line 218
    .local v2, "text":Ljava/lang/String;
    const-string v5, "extra-exceptions"

    invoke-virtual {p1, v5}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_63

    .line 219
    if-eqz v1, :cond_41

    instance-of v5, v1, Ljava/util/ArrayList;

    if-eqz v5, :cond_41

    move-object v3, v1

    .line 220
    check-cast v3, Ljava/util/Collection;

    .line 221
    .local v3, "throwables":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/Throwable;>;"
    const-string v5, "\n\n"

    invoke-static {v3, v5}, Lcom/adobe/creativesdk/aviary/internal/utils/ThrowableUtils;->getLocalizedMessage(Ljava/util/Collection;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v2

    .line 227
    .end local v3    # "throwables":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/Throwable;>;"
    :cond_41
    :goto_41
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 228
    .local v0, "alert":Landroid/app/AlertDialog$Builder;
    invoke-virtual {v0, v4}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 229
    const v5, 0x1080027

    invoke-virtual {v0, v5}, Landroid/app/AlertDialog$Builder;->setIcon(I)Landroid/app/AlertDialog$Builder;

    .line 231
    if-eqz v2, :cond_54

    .line 232
    invoke-virtual {v0, v2}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 235
    :cond_54
    const/high16 v5, 0x1040000

    new-instance v6, Lcom/adobe/creativesdk/aviary/internal/MonitoredActivity$3;

    invoke-direct {v6, p0}, Lcom/adobe/creativesdk/aviary/internal/MonitoredActivity$3;-><init>(Lcom/adobe/creativesdk/aviary/internal/MonitoredActivity;)V

    invoke-virtual {v0, v5, v6}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 243
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v5

    goto :goto_a

    .line 223
    .end local v0    # "alert":Landroid/app/AlertDialog$Builder;
    :cond_63
    const-string v5, "android.intent.extra.TEXT"

    invoke-virtual {p1, v5}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_41

    .line 224
    const-string v5, "android.intent.extra.TEXT"

    invoke-virtual {p1, v5}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    goto :goto_41
.end method

.method private initializeBroadcastReceivers()V
    .registers 3

    .prologue
    .line 253
    new-instance v0, Landroid/content/IntentFilter;

    const-string v1, "aviary.intent.action.ALERT"

    invoke-direct {v0, v1}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    .line 256
    .local v0, "filter":Landroid/content/IntentFilter;
    invoke-static {p0}, Lcom/adobe/creativesdk/aviary/internal/utils/PackageManagerUtils;->isStandalone(Landroid/content/Context;)Z

    move-result v1

    if-nez v1, :cond_12

    .line 257
    const-string v1, "aviary.intent.action.KILL"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 260
    :cond_12
    new-instance v1, Lcom/adobe/creativesdk/aviary/internal/MonitoredActivity$4;

    invoke-direct {v1, p0}, Lcom/adobe/creativesdk/aviary/internal/MonitoredActivity$4;-><init>(Lcom/adobe/creativesdk/aviary/internal/MonitoredActivity;)V

    iput-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/MonitoredActivity;->mBroadcastReceiver:Landroid/content/BroadcastReceiver;

    .line 279
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/MonitoredActivity;->mBroadcastReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v1, v0}, Lcom/adobe/creativesdk/aviary/internal/MonitoredActivity;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 280
    return-void
.end method

.method private initializeCDS()V
    .registers 6

    .prologue
    const/4 v4, 0x0

    .line 286
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/MonitoredActivity;->getBaseContext()Landroid/content/Context;

    move-result-object v2

    const-string v3, "editor-opened"

    invoke-static {v2, v3}, Lcom/adobe/creativesdk/aviary/AdobeImageIntent;->createCdsInitIntent(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    .line 287
    .local v0, "intent":Landroid/content/Intent;
    const-string v2, "extra-lazy-execution"

    invoke-virtual {v0, v2, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 288
    const-string v2, "extra-execute-wifi-only"

    invoke-virtual {v0, v2, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 289
    const-string v2, "extra-execute-plugged-only"

    invoke-virtual {v0, v2, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 290
    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/aviary/internal/MonitoredActivity;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    move-result-object v1

    .line 292
    .local v1, "result":Landroid/content/ComponentName;
    if-nez v1, :cond_25

    .line 293
    const-string v2, "\'AviaryCdsService\' not found, did you forget to add to your AndroidManifest.xml file?"

    .line 294
    invoke-static {v2}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory;->printDeveloperError(Ljava/lang/String;)V

    .line 297
    :cond_25
    invoke-static {v1}, Ljunit/framework/Assert;->assertNotNull(Ljava/lang/Object;)V

    .line 298
    return-void
.end method

.method private lazyInitialize()V
    .registers 3

    .prologue
    .line 151
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/adobe/creativesdk/aviary/internal/MonitoredActivity$1;

    invoke-direct {v1, p0}, Lcom/adobe/creativesdk/aviary/internal/MonitoredActivity$1;-><init>(Lcom/adobe/creativesdk/aviary/internal/MonitoredActivity;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 161
    .local v0, "thread":Ljava/lang/Thread;
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/Thread;->setPriority(I)V

    .line 162
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 163
    return-void
.end method

.method private onAlertMessageReceived(Landroid/content/Intent;)V
    .registers 8
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 187
    const-string v3, "MonitoredActivity"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "onAlertMessage: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 189
    if-eqz p1, :cond_35

    .line 190
    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 191
    .local v0, "action":Ljava/lang/String;
    invoke-virtual {p1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v2

    .line 193
    .local v2, "extras":Landroid/os/Bundle;
    if-eqz v2, :cond_35

    .line 194
    const-string v3, "aviary.intent.action.ALERT"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_35

    .line 195
    invoke-direct {p0, v2}, Lcom/adobe/creativesdk/aviary/internal/MonitoredActivity;->generateAlertDialog(Landroid/os/Bundle;)Landroid/app/AlertDialog;

    move-result-object v1

    .line 196
    .local v1, "dialog":Landroid/app/AlertDialog;
    if-eqz v1, :cond_35

    .line 197
    invoke-virtual {v1}, Landroid/app/AlertDialog;->show()V

    .line 202
    .end local v0    # "action":Ljava/lang/String;
    .end local v1    # "dialog":Landroid/app/AlertDialog;
    .end local v2    # "extras":Landroid/os/Bundle;
    :cond_35
    return-void
.end method

.method private onKill()V
    .registers 4

    .prologue
    .line 169
    const-string v0, "MonitoredActivity"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onKill: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/MonitoredActivity;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 171
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v1, "Removed"

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "We\'re sorry but the application has been banned. Please contact the developer."

    .line 172
    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const/4 v1, 0x0

    .line 173
    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x104000a

    new-instance v2, Lcom/adobe/creativesdk/aviary/internal/MonitoredActivity$2;

    invoke-direct {v2, p0}, Lcom/adobe/creativesdk/aviary/internal/MonitoredActivity$2;-><init>(Lcom/adobe/creativesdk/aviary/internal/MonitoredActivity;)V

    .line 174
    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 183
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 184
    return-void
.end method


# virtual methods
.method public isDestroyed()Z
    .registers 2

    .prologue
    .line 359
    iget-boolean v0, p0, Lcom/adobe/creativesdk/aviary/internal/MonitoredActivity;->mDestroy:Z

    return v0
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .registers 5
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 134
    invoke-super {p0, p1}, Lcom/adobe/creativesdk/aviary/ToolBarActivity;->onCreate(Landroid/os/Bundle;)V

    .line 135
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/adobe/creativesdk/aviary/internal/MonitoredActivity;->mDestroy:Z

    .line 137
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/MonitoredActivity;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_c
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1c

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/aviary/internal/MonitoredActivity$LifeCycleListener;

    .line 138
    .local v0, "listener":Lcom/adobe/creativesdk/aviary/internal/MonitoredActivity$LifeCycleListener;
    invoke-interface {v0, p0}, Lcom/adobe/creativesdk/aviary/internal/MonitoredActivity$LifeCycleListener;->onActivityCreated(Lcom/adobe/creativesdk/aviary/internal/MonitoredActivity;)V

    goto :goto_c

    .line 141
    .end local v0    # "listener":Lcom/adobe/creativesdk/aviary/internal/MonitoredActivity$LifeCycleListener;
    :cond_1c
    invoke-static {p0}, Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;->getInstance(Landroid/content/Context;)Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;

    move-result-object v1

    iput-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/MonitoredActivity;->mTracker:Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;

    .line 142
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/MonitoredActivity;->mTracker:Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;->open()V

    .line 143
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/MonitoredActivity;->mTracker:Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;->upload()V

    .line 145
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/internal/MonitoredActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/adobe/creativesdk/aviary/internal/receipt/ReceiptFactory;->getReceiptManager(Landroid/content/Context;)Lcom/adobe/creativesdk/aviary/internal/receipt/IReceiptManager;

    move-result-object v1

    iput-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/MonitoredActivity;->mReceiptManager:Lcom/adobe/creativesdk/aviary/internal/receipt/IReceiptManager;

    .line 147
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/internal/MonitoredActivity;->lazyInitialize()V

    .line 148
    return-void
.end method

.method protected onDestroy()V
    .registers 4

    .prologue
    .line 302
    const-string v1, "MonitoredActivity"

    const-string v2, "onDestroy"

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 303
    invoke-super {p0}, Lcom/adobe/creativesdk/aviary/ToolBarActivity;->onDestroy()V

    .line 304
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/adobe/creativesdk/aviary/internal/MonitoredActivity;->mDestroy:Z

    .line 305
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/MonitoredActivity;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_13
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_23

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/aviary/internal/MonitoredActivity$LifeCycleListener;

    .line 306
    .local v0, "listener":Lcom/adobe/creativesdk/aviary/internal/MonitoredActivity$LifeCycleListener;
    invoke-interface {v0, p0}, Lcom/adobe/creativesdk/aviary/internal/MonitoredActivity$LifeCycleListener;->onActivityDestroyed(Lcom/adobe/creativesdk/aviary/internal/MonitoredActivity;)V

    goto :goto_13

    .line 309
    .end local v0    # "listener":Lcom/adobe/creativesdk/aviary/internal/MonitoredActivity$LifeCycleListener;
    :cond_23
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/MonitoredActivity;->mBroadcastReceiver:Landroid/content/BroadcastReceiver;

    if-eqz v1, :cond_2f

    .line 310
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/MonitoredActivity;->mBroadcastReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v1}, Lcom/adobe/creativesdk/aviary/internal/MonitoredActivity;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 311
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/MonitoredActivity;->mBroadcastReceiver:Landroid/content/BroadcastReceiver;

    .line 313
    :cond_2f
    return-void
.end method

.method protected onPause()V
    .registers 3

    .prologue
    .line 335
    const-string v0, "MonitoredActivity"

    const-string v1, "onPause"

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 336
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/MonitoredActivity;->mTracker:Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;->close()V

    .line 337
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/MonitoredActivity;->mTracker:Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;->upload()V

    .line 339
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/MonitoredActivity;->mReceiptManager:Lcom/adobe/creativesdk/aviary/internal/receipt/IReceiptManager;

    if-eqz v0, :cond_1f

    .line 340
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/MonitoredActivity;->mReceiptManager:Lcom/adobe/creativesdk/aviary/internal/receipt/IReceiptManager;

    invoke-interface {v0}, Lcom/adobe/creativesdk/aviary/internal/receipt/IReceiptManager;->close()V

    .line 341
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/MonitoredActivity;->mReceiptManager:Lcom/adobe/creativesdk/aviary/internal/receipt/IReceiptManager;

    invoke-interface {v0}, Lcom/adobe/creativesdk/aviary/internal/receipt/IReceiptManager;->upload()V

    .line 343
    :cond_1f
    invoke-super {p0}, Lcom/adobe/creativesdk/aviary/ToolBarActivity;->onPause()V

    .line 344
    return-void
.end method

.method protected onResume()V
    .registers 3

    .prologue
    .line 348
    const-string v0, "MonitoredActivity"

    const-string v1, "onResume"

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 349
    invoke-super {p0}, Lcom/adobe/creativesdk/aviary/ToolBarActivity;->onResume()V

    .line 350
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/MonitoredActivity;->mTracker:Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;->open()V

    .line 352
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/MonitoredActivity;->mReceiptManager:Lcom/adobe/creativesdk/aviary/internal/receipt/IReceiptManager;

    if-eqz v0, :cond_1d

    .line 353
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/MonitoredActivity;->mReceiptManager:Lcom/adobe/creativesdk/aviary/internal/receipt/IReceiptManager;

    invoke-interface {v0}, Lcom/adobe/creativesdk/aviary/internal/receipt/IReceiptManager;->open()V

    .line 354
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/MonitoredActivity;->mReceiptManager:Lcom/adobe/creativesdk/aviary/internal/receipt/IReceiptManager;

    invoke-interface {v0}, Lcom/adobe/creativesdk/aviary/internal/receipt/IReceiptManager;->upload()V

    .line 356
    :cond_1d
    return-void
.end method

.method protected onStart()V
    .registers 4

    .prologue
    .line 317
    const-string v1, "MonitoredActivity"

    const-string v2, "onStart"

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 318
    invoke-super {p0}, Lcom/adobe/creativesdk/aviary/ToolBarActivity;->onStart()V

    .line 319
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/MonitoredActivity;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_10
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_20

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/aviary/internal/MonitoredActivity$LifeCycleListener;

    .line 320
    .local v0, "listener":Lcom/adobe/creativesdk/aviary/internal/MonitoredActivity$LifeCycleListener;
    invoke-interface {v0, p0}, Lcom/adobe/creativesdk/aviary/internal/MonitoredActivity$LifeCycleListener;->onActivityStarted(Lcom/adobe/creativesdk/aviary/internal/MonitoredActivity;)V

    goto :goto_10

    .line 322
    .end local v0    # "listener":Lcom/adobe/creativesdk/aviary/internal/MonitoredActivity$LifeCycleListener;
    :cond_20
    return-void
.end method

.method protected onStop()V
    .registers 4

    .prologue
    .line 326
    const-string v1, "MonitoredActivity"

    const-string v2, "onStop"

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 327
    invoke-super {p0}, Lcom/adobe/creativesdk/aviary/ToolBarActivity;->onStop()V

    .line 328
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/internal/MonitoredActivity;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_10
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_20

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/aviary/internal/MonitoredActivity$LifeCycleListener;

    .line 329
    .local v0, "listener":Lcom/adobe/creativesdk/aviary/internal/MonitoredActivity$LifeCycleListener;
    invoke-interface {v0, p0}, Lcom/adobe/creativesdk/aviary/internal/MonitoredActivity$LifeCycleListener;->onActivityStopped(Lcom/adobe/creativesdk/aviary/internal/MonitoredActivity;)V

    goto :goto_10

    .line 331
    .end local v0    # "listener":Lcom/adobe/creativesdk/aviary/internal/MonitoredActivity$LifeCycleListener;
    :cond_20
    return-void
.end method
