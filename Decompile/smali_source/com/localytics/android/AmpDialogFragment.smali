.class public Lcom/localytics/android/AmpDialogFragment;
.super Landroid/support/v4/app/DialogFragment;
.source "AmpDialogFragment.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/localytics/android/AmpDialogFragment$AmpDialog;
    }
.end annotation


# static fields
.field private static sDismissButtonImage:Landroid/graphics/Bitmap;


# instance fields
.field private mAmpDialog:Lcom/localytics/android/AmpDialogFragment$AmpDialog;

.field private mAmpMessage:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private mCallbacks:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Integer;",
            "Lcom/localytics/android/AmpCallable;",
            ">;"
        }
    .end annotation
.end field

.field private mEnterAnimatable:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private mExitAnimatable:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private mJavaScriptClient:Lcom/localytics/android/JavaScriptClient;

.field private mUploadedViewEvent:Ljava/util/concurrent/atomic/AtomicBoolean;


# direct methods
.method public constructor <init>()V
    .registers 3

    .prologue
    const/4 v1, 0x1

    .line 115
    invoke-direct {p0}, Landroid/support/v4/app/DialogFragment;-><init>()V

    .line 116
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Lcom/localytics/android/AmpDialogFragment;->mEnterAnimatable:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 117
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Lcom/localytics/android/AmpDialogFragment;->mExitAnimatable:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 118
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Lcom/localytics/android/AmpDialogFragment;->mUploadedViewEvent:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 119
    return-void
.end method

.method static synthetic access$000(Lcom/localytics/android/AmpDialogFragment;)Lcom/localytics/android/AmpDialogFragment$AmpDialog;
    .registers 2
    .param p0, "x0"    # Lcom/localytics/android/AmpDialogFragment;

    .prologue
    .line 63
    iget-object v0, p0, Lcom/localytics/android/AmpDialogFragment;->mAmpDialog:Lcom/localytics/android/AmpDialogFragment$AmpDialog;

    return-object v0
.end method

.method static synthetic access$200(Lcom/localytics/android/AmpDialogFragment;)Ljava/util/Map;
    .registers 2
    .param p0, "x0"    # Lcom/localytics/android/AmpDialogFragment;

    .prologue
    .line 63
    iget-object v0, p0, Lcom/localytics/android/AmpDialogFragment;->mAmpMessage:Ljava/util/Map;

    return-object v0
.end method

.method static synthetic access$300(Lcom/localytics/android/AmpDialogFragment;)Ljava/util/concurrent/atomic/AtomicBoolean;
    .registers 2
    .param p0, "x0"    # Lcom/localytics/android/AmpDialogFragment;

    .prologue
    .line 63
    iget-object v0, p0, Lcom/localytics/android/AmpDialogFragment;->mExitAnimatable:Ljava/util/concurrent/atomic/AtomicBoolean;

    return-object v0
.end method

.method static synthetic access$400(Lcom/localytics/android/AmpDialogFragment;)Ljava/util/concurrent/atomic/AtomicBoolean;
    .registers 2
    .param p0, "x0"    # Lcom/localytics/android/AmpDialogFragment;

    .prologue
    .line 63
    iget-object v0, p0, Lcom/localytics/android/AmpDialogFragment;->mEnterAnimatable:Ljava/util/concurrent/atomic/AtomicBoolean;

    return-object v0
.end method

.method static synthetic access$500(Lcom/localytics/android/AmpDialogFragment;)Lcom/localytics/android/JavaScriptClient;
    .registers 2
    .param p0, "x0"    # Lcom/localytics/android/AmpDialogFragment;

    .prologue
    .line 63
    iget-object v0, p0, Lcom/localytics/android/AmpDialogFragment;->mJavaScriptClient:Lcom/localytics/android/JavaScriptClient;

    return-object v0
.end method

.method static synthetic access$900()Landroid/graphics/Bitmap;
    .registers 1

    .prologue
    .line 63
    sget-object v0, Lcom/localytics/android/AmpDialogFragment;->sDismissButtonImage:Landroid/graphics/Bitmap;

    return-object v0
.end method

.method private getValueByQueryKey(Ljava/lang/String;Ljava/net/URI;)Ljava/lang/String;
    .registers 14
    .param p1, "queryKey"    # Ljava/lang/String;
    .param p2, "url"    # Ljava/net/URI;

    .prologue
    const/4 v8, 0x0

    .line 443
    invoke-virtual {p2}, Ljava/net/URI;->getQuery()Ljava/lang/String;

    move-result-object v7

    .line 445
    .local v7, "query":Ljava/lang/String;
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v9

    if-nez v9, :cond_11

    invoke-static {v7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v9

    if-eqz v9, :cond_12

    .line 470
    :cond_11
    :goto_11
    return-object v8

    .line 450
    :cond_12
    invoke-virtual {p2}, Ljava/net/URI;->getQuery()Ljava/lang/String;

    move-result-object v9

    const-string v10, "[&]"

    invoke-virtual {v9, v10}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v6

    .line 451
    .local v6, "pairs":[Ljava/lang/String;
    move-object v0, v6

    .local v0, "arr$":[Ljava/lang/String;
    array-length v4, v0

    .local v4, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    :goto_1f
    if-ge v3, v4, :cond_11

    aget-object v5, v0, v3

    .line 453
    .local v5, "pair":Ljava/lang/String;
    const-string v9, "[=]"

    invoke-virtual {v5, v9}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    .line 454
    .local v1, "components":[Ljava/lang/String;
    const/4 v9, 0x0

    aget-object v9, v1, v9

    invoke-virtual {v9, p1}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v9

    if-nez v9, :cond_42

    .line 456
    const/4 v9, 0x2

    array-length v10, v1

    if-ne v9, v10, :cond_42

    .line 460
    const/4 v9, 0x1

    :try_start_37
    aget-object v9, v1, v9

    const-string v10, "UTF-8"

    invoke-static {v9, v10}, Ljava/net/URLDecoder;->decode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    :try_end_3e
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_37 .. :try_end_3e} :catch_40

    move-result-object v8

    goto :goto_11

    .line 462
    :catch_40
    move-exception v2

    .line 464
    .local v2, "e":Ljava/io/UnsupportedEncodingException;
    goto :goto_11

    .line 451
    .end local v2    # "e":Ljava/io/UnsupportedEncodingException;
    :cond_42
    add-int/lit8 v3, v3, 0x1

    goto :goto_1f
.end method

.method private getValueByQueryKey(Ljava/lang/String;Ljava/net/URL;)Ljava/lang/String;
    .registers 5
    .param p1, "queryKey"    # Ljava/lang/String;
    .param p2, "url"    # Ljava/net/URL;

    .prologue
    .line 433
    :try_start_0
    invoke-virtual {p2}, Ljava/net/URL;->toURI()Ljava/net/URI;

    move-result-object v1

    invoke-direct {p0, p1, v1}, Lcom/localytics/android/AmpDialogFragment;->getValueByQueryKey(Ljava/lang/String;Ljava/net/URI;)Ljava/lang/String;
    :try_end_7
    .catch Ljava/net/URISyntaxException; {:try_start_0 .. :try_end_7} :catch_9

    move-result-object v1

    .line 437
    :goto_8
    return-object v1

    .line 435
    :catch_9
    move-exception v0

    .line 437
    .local v0, "e":Ljava/net/URISyntaxException;
    const/4 v1, 0x0

    goto :goto_8
.end method

.method private handleCustomProtocolRequest(Ljava/lang/String;Landroid/app/Activity;)I
    .registers 7
    .param p1, "urlString"    # Ljava/lang/String;
    .param p2, "activity"    # Landroid/app/Activity;

    .prologue
    .line 1171
    new-instance v1, Landroid/content/Intent;

    const-string v2, "android.intent.action.VIEW"

    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 1172
    .local v1, "intent":Landroid/content/Intent;
    iget-object v2, p0, Lcom/localytics/android/AmpDialogFragment;->mAmpDialog:Lcom/localytics/android/AmpDialogFragment$AmpDialog;

    invoke-virtual {v2}, Lcom/localytics/android/AmpDialogFragment$AmpDialog;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v2, v1, v3}, Landroid/content/pm/PackageManager;->queryIntentActivities(Landroid/content/Intent;I)Ljava/util/List;

    move-result-object v0

    .line 1173
    .local v0, "activities":Ljava/util/List;, "Ljava/util/List<Landroid/content/pm/ResolveInfo;>;"
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v2

    if-lez v2, :cond_35

    .line 1175
    sget-boolean v2, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v2, :cond_2b

    .line 1177
    const-string v2, "Localytics"

    const-string v3, "[AMP Nav Handler]: An app on this device is registered to handle this protocol scheme. Opening..."

    invoke-static {v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1179
    :cond_2b
    const/high16 v2, 0x20000

    invoke-virtual {v1, v2}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 1180
    invoke-virtual {p2, v1}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    .line 1181
    const/4 v2, 0x2

    .line 1184
    :goto_34
    return v2

    :cond_35
    const/4 v2, -0x2

    goto :goto_34
.end method

.method private handleCustomProtocolRequest(Ljava/net/URL;Landroid/app/Activity;)I
    .registers 4
    .param p1, "url"    # Ljava/net/URL;
    .param p2, "activity"    # Landroid/app/Activity;

    .prologue
    .line 1166
    invoke-virtual {p1}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0, p2}, Lcom/localytics/android/AmpDialogFragment;->handleCustomProtocolRequest(Ljava/lang/String;Landroid/app/Activity;)I

    move-result v0

    return v0
.end method

.method private handleFileProtocolRequest(Ljava/net/URL;)I
    .registers 5
    .param p1, "url"    # Ljava/net/URL;

    .prologue
    .line 1111
    invoke-virtual {p1}, Ljava/net/URL;->getProtocol()Ljava/lang/String;

    move-result-object v0

    const-string v1, "file"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_e

    .line 1113
    const/4 v0, -0x1

    .line 1121
    :goto_d
    return v0

    .line 1116
    :cond_e
    sget-boolean v0, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v0, :cond_20

    .line 1118
    const-string v0, "Localytics"

    const-string v1, "[AMP Nav Handler]: Displaying content from your local creatives."

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1121
    :cond_20
    const/4 v0, 0x1

    goto :goto_d
.end method

.method private handleHttpProtocolRequest(Ljava/net/URL;Landroid/app/Activity;)I
    .registers 13
    .param p1, "url"    # Ljava/net/URL;
    .param p2, "activity"    # Landroid/app/Activity;

    .prologue
    const/4 v4, 0x1

    const/4 v9, 0x0

    .line 1126
    invoke-virtual {p1}, Ljava/net/URL;->getProtocol()Ljava/lang/String;

    move-result-object v3

    .line 1127
    .local v3, "protocol":Ljava/lang/String;
    const-string v5, "http"

    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_18

    const-string v5, "https"

    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_18

    .line 1129
    const/4 v4, -0x1

    .line 1161
    :cond_17
    :goto_17
    return v4

    .line 1132
    :cond_18
    sget-boolean v5, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v5, :cond_23

    .line 1134
    const-string v5, "Localytics"

    const-string v6, "[AMP Nav Handler]: Handling a request for an external HTTP address."

    invoke-static {v5, v6}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1138
    :cond_23
    const-string v5, "ampExternalOpen"

    invoke-direct {p0, v5, p1}, Lcom/localytics/android/AmpDialogFragment;->getValueByQueryKey(Ljava/lang/String;Ljava/net/URL;)Ljava/lang/String;

    move-result-object v2

    .line 1139
    .local v2, "openExternalValue":Ljava/lang/String;
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_7a

    sget-object v5, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v2, v5}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v5

    const-string v6, "true"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_7a

    .line 1141
    sget-boolean v5, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v5, :cond_52

    .line 1143
    const-string v5, "Localytics"

    const-string v6, "[AMP Nav Handler]: Query string hook [%s] set to true. Opening the URL in chrome"

    new-array v7, v4, [Ljava/lang/Object;

    const-string v8, "ampExternalOpen"

    aput-object v8, v7, v9

    invoke-static {v6, v7}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1146
    :cond_52
    new-instance v1, Landroid/content/Intent;

    const-string v5, "android.intent.action.VIEW"

    invoke-virtual {p1}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v6

    invoke-direct {v1, v5, v6}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 1147
    .local v1, "intent":Landroid/content/Intent;
    iget-object v5, p0, Lcom/localytics/android/AmpDialogFragment;->mAmpDialog:Lcom/localytics/android/AmpDialogFragment$AmpDialog;

    invoke-virtual {v5}, Lcom/localytics/android/AmpDialogFragment$AmpDialog;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-virtual {v5}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v5

    invoke-virtual {v5, v1, v9}, Landroid/content/pm/PackageManager;->queryIntentActivities(Landroid/content/Intent;I)Ljava/util/List;

    move-result-object v0

    .line 1148
    .local v0, "activities":Ljava/util/List;, "Ljava/util/List<Landroid/content/pm/ResolveInfo;>;"
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v5

    if-lez v5, :cond_7a

    .line 1150
    invoke-virtual {p2, v1}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    .line 1151
    const/4 v4, 0x2

    goto :goto_17

    .line 1156
    .end local v0    # "activities":Ljava/util/List;, "Ljava/util/List<Landroid/content/pm/ResolveInfo;>;"
    .end local v1    # "intent":Landroid/content/Intent;
    :cond_7a
    sget-boolean v5, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v5, :cond_17

    .line 1158
    const-string v5, "Localytics"

    const-string v6, "[AMP Nav Handler]: Loading HTTP request inside the current AMP view"

    invoke-static {v5, v6}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_17
.end method

.method public static newInstance()Lcom/localytics/android/AmpDialogFragment;
    .registers 2

    .prologue
    .line 269
    new-instance v0, Lcom/localytics/android/AmpDialogFragment;

    invoke-direct {v0}, Lcom/localytics/android/AmpDialogFragment;-><init>()V

    .line 270
    .local v0, "fragment":Lcom/localytics/android/AmpDialogFragment;
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/localytics/android/AmpDialogFragment;->setRetainInstance(Z)V

    .line 271
    return-object v0
.end method

.method private tagAmpActionEventWithAction(Ljava/lang/String;)V
    .registers 14
    .param p1, "action"    # Ljava/lang/String;

    .prologue
    const/4 v11, 0x2

    const/4 v10, 0x0

    const/4 v9, 0x1

    .line 385
    iget-object v6, p0, Lcom/localytics/android/AmpDialogFragment;->mUploadedViewEvent:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v6, v9}, Ljava/util/concurrent/atomic/AtomicBoolean;->getAndSet(Z)Z

    move-result v6

    if-eqz v6, :cond_1f

    .line 387
    sget-boolean v6, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v6, :cond_1e

    .line 389
    const-string v6, "Localytics"

    const-string v7, "The AMP action for this message has already been set. Ignoring AMP Action: [%s]"

    new-array v8, v9, [Ljava/lang/Object;

    aput-object p1, v8, v10

    invoke-static {v7, v8}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 427
    :cond_1e
    :goto_1e
    return-void

    .line 395
    :cond_1f
    new-instance v1, Ljava/util/TreeMap;

    invoke-direct {v1}, Ljava/util/TreeMap;-><init>()V

    .line 396
    .local v1, "attributes":Ljava/util/TreeMap;, "Ljava/util/TreeMap<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v6, "ampAction"

    invoke-virtual {v1, v6, p1}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 397
    const-string v6, "ampCampaignId"

    iget-object v7, p0, Lcom/localytics/android/AmpDialogFragment;->mAmpMessage:Ljava/util/Map;

    const-string v8, "campaign_id"

    invoke-interface {v7, v8}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v1, v6, v7}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 398
    const-string v6, "ampCampaign"

    iget-object v7, p0, Lcom/localytics/android/AmpDialogFragment;->mAmpMessage:Ljava/util/Map;

    const-string v8, "rule_name"

    invoke-interface {v7, v8}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v1, v6, v7}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 400
    iget-object v6, p0, Lcom/localytics/android/AmpDialogFragment;->mAmpMessage:Ljava/util/Map;

    const-string v7, "ab_test"

    invoke-interface {v6, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 401
    .local v0, "ab":Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-nez v6, :cond_60

    .line 403
    const-string v6, "ampAB"

    invoke-virtual {v1, v6, v0}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 406
    :cond_60
    invoke-static {}, Lcom/localytics/android/LocalyticsAmpSession;->isTestModeEnabled()Z

    move-result v6

    if-nez v6, :cond_1e

    .line 409
    iget-object v6, p0, Lcom/localytics/android/AmpDialogFragment;->mCallbacks:Ljava/util/Map;

    if-eqz v6, :cond_1e

    .line 410
    iget-object v6, p0, Lcom/localytics/android/AmpDialogFragment;->mCallbacks:Ljava/util/Map;

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-interface {v6, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/localytics/android/AmpCallable;

    .line 411
    .local v3, "callable":Lcom/localytics/android/AmpCallable;
    if-eqz v3, :cond_83

    .line 413
    new-array v6, v11, [Ljava/lang/Object;

    const-string v7, "ampView"

    aput-object v7, v6, v10

    aput-object v1, v6, v9

    invoke-virtual {v3, v6}, Lcom/localytics/android/AmpCallable;->call([Ljava/lang/Object;)Ljava/lang/Object;

    .line 416
    :cond_83
    sget-boolean v6, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v6, :cond_1e

    .line 418
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 419
    .local v2, "builder":Ljava/lang/StringBuilder;
    invoke-virtual {v1}, Ljava/util/TreeMap;->entrySet()Ljava/util/Set;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    .local v5, "i$":Ljava/util/Iterator;
    :goto_94
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_cd

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/Map$Entry;

    .line 421
    .local v4, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Key = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-interface {v4}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ", Value = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-interface {v4}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_94

    .line 423
    .end local v4    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_cd
    const-string v6, "Localytics"

    const-string v7, "AMP event tagged successfully.\n   Attributes Dictionary = \n%s"

    new-array v8, v9, [Ljava/lang/Object;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    aput-object v9, v8, v10

    invoke-static {v7, v8}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_1e
.end method

.method private tagAmpActionForURL(Ljava/net/URI;)V
    .registers 8
    .param p1, "url"    # Ljava/net/URI;

    .prologue
    .line 362
    const-string v2, "ampAction"

    invoke-direct {p0, v2, p1}, Lcom/localytics/android/AmpDialogFragment;->getValueByQueryKey(Ljava/lang/String;Ljava/net/URI;)Ljava/lang/String;

    move-result-object v0

    .line 363
    .local v0, "ampActionValue":Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_25

    .line 365
    sget-boolean v2, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v2, :cond_21

    .line 367
    const-string v2, "Localytics"

    const-string v3, "Attempting to tag event with custom AMP action.[Action: %s]"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object v0, v4, v5

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 369
    :cond_21
    invoke-direct {p0, v0}, Lcom/localytics/android/AmpDialogFragment;->tagAmpActionEventWithAction(Ljava/lang/String;)V

    .line 381
    :cond_24
    :goto_24
    return-void

    .line 375
    :cond_25
    invoke-virtual {p1}, Ljava/net/URI;->getScheme()Ljava/lang/String;

    move-result-object v1

    .line 376
    .local v1, "protocol":Ljava/lang/String;
    const-string v2, "file"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_24

    const-string v2, "http"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_24

    const-string v2, "https"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_24

    .line 378
    const-string v2, "click"

    invoke-direct {p0, v2}, Lcom/localytics/android/AmpDialogFragment;->tagAmpActionEventWithAction(Ljava/lang/String;)V

    goto :goto_24
.end method


# virtual methods
.method handleUrl(Ljava/lang/String;Landroid/app/Activity;)Z
    .registers 15
    .param p1, "urlString"    # Ljava/lang/String;
    .param p2, "activity"    # Landroid/app/Activity;

    .prologue
    const/4 v4, 0x1

    const/4 v5, 0x0

    const/4 v11, 0x2

    .line 1029
    move-object v3, p1

    .line 1031
    .local v3, "url":Ljava/lang/String;
    sget-boolean v6, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v6, :cond_17

    .line 1033
    const-string v6, "Localytics"

    const-string v7, "[AMP Nav Handler]: Evaluating AMP URL:\n\tURL:%s"

    new-array v8, v4, [Ljava/lang/Object;

    aput-object v3, v8, v5

    invoke-static {v7, v8}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1036
    :cond_17
    const/4 v2, 0x0

    .line 1039
    .local v2, "result":I
    :try_start_18
    const-string v6, "://"

    invoke-virtual {v3, v6}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_2b

    .line 1041
    const/4 v6, 0x0

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v7

    add-int/lit8 v7, v7, -0x1

    invoke-virtual {v3, v6, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    .line 1045
    :cond_2b
    new-instance v6, Ljava/net/URI;

    invoke-direct {v6, v3}, Ljava/net/URI;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, v6}, Lcom/localytics/android/AmpDialogFragment;->tagAmpActionForURL(Ljava/net/URI;)V

    .line 1051
    new-instance v0, Ljava/net/URL;

    invoke-direct {v0, v3}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 1054
    .local v0, "aURL":Ljava/net/URL;
    invoke-direct {p0, v0}, Lcom/localytics/android/AmpDialogFragment;->handleFileProtocolRequest(Ljava/net/URL;)I
    :try_end_3b
    .catch Ljava/lang/Exception; {:try_start_18 .. :try_end_3b} :catch_88
    .catchall {:try_start_18 .. :try_end_3b} :catchall_b7

    move-result v2

    if-lez v2, :cond_48

    .line 1056
    if-ne v2, v11, :cond_46

    .line 1092
    :goto_40
    if-ne v2, v11, :cond_45

    .line 1094
    invoke-virtual {p0}, Lcom/localytics/android/AmpDialogFragment;->dismiss()V

    .line 1098
    .end local v0    # "aURL":Ljava/net/URL;
    :cond_45
    :goto_45
    return v4

    .restart local v0    # "aURL":Ljava/net/URL;
    :cond_46
    move v4, v5

    .line 1056
    goto :goto_40

    .line 1060
    :cond_48
    :try_start_48
    invoke-direct {p0, v0, p2}, Lcom/localytics/android/AmpDialogFragment;->handleHttpProtocolRequest(Ljava/net/URL;Landroid/app/Activity;)I
    :try_end_4b
    .catch Ljava/lang/Exception; {:try_start_48 .. :try_end_4b} :catch_88
    .catchall {:try_start_48 .. :try_end_4b} :catchall_b7

    move-result v2

    if-lez v2, :cond_58

    .line 1062
    if-ne v2, v11, :cond_56

    .line 1092
    :goto_50
    if-ne v2, v11, :cond_45

    .line 1094
    invoke-virtual {p0}, Lcom/localytics/android/AmpDialogFragment;->dismiss()V

    goto :goto_45

    :cond_56
    move v4, v5

    .line 1062
    goto :goto_50

    .line 1066
    :cond_58
    :try_start_58
    invoke-direct {p0, v0, p2}, Lcom/localytics/android/AmpDialogFragment;->handleCustomProtocolRequest(Ljava/net/URL;Landroid/app/Activity;)I
    :try_end_5b
    .catch Ljava/lang/Exception; {:try_start_58 .. :try_end_5b} :catch_88
    .catchall {:try_start_58 .. :try_end_5b} :catchall_b7

    move-result v2

    if-lez v2, :cond_68

    .line 1068
    if-ne v2, v11, :cond_66

    .line 1092
    :goto_60
    if-ne v2, v11, :cond_45

    .line 1094
    invoke-virtual {p0}, Lcom/localytics/android/AmpDialogFragment;->dismiss()V

    goto :goto_45

    :cond_66
    move v4, v5

    .line 1068
    goto :goto_60

    .line 1071
    :cond_68
    :try_start_68
    sget-boolean v6, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v6, :cond_81

    .line 1073
    const-string v6, "Localytics"

    const-string v7, "[AMP Nav Handler]: Protocol handler scheme not recognized. Attempting to load the URL... [Scheme: %s]"

    const/4 v8, 0x1

    new-array v8, v8, [Ljava/lang/Object;

    const/4 v9, 0x0

    invoke-virtual {v0}, Ljava/net/URL;->getProtocol()Ljava/lang/String;

    move-result-object v10

    aput-object v10, v8, v9

    invoke-static {v7, v8}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_81
    .catch Ljava/lang/Exception; {:try_start_68 .. :try_end_81} :catch_88
    .catchall {:try_start_68 .. :try_end_81} :catchall_b7

    .line 1092
    :cond_81
    if-ne v2, v11, :cond_86

    .line 1094
    invoke-virtual {p0}, Lcom/localytics/android/AmpDialogFragment;->dismiss()V

    .end local v0    # "aURL":Ljava/net/URL;
    :cond_86
    :goto_86
    move v4, v5

    .line 1098
    goto :goto_45

    .line 1076
    :catch_88
    move-exception v1

    .line 1079
    .local v1, "e":Ljava/lang/Exception;
    :try_start_89
    invoke-direct {p0, v3, p2}, Lcom/localytics/android/AmpDialogFragment;->handleCustomProtocolRequest(Ljava/lang/String;Landroid/app/Activity;)I
    :try_end_8c
    .catchall {:try_start_89 .. :try_end_8c} :catchall_b7

    move-result v2

    if-lez v2, :cond_99

    .line 1081
    if-ne v2, v11, :cond_97

    .line 1092
    :goto_91
    if-ne v2, v11, :cond_45

    .line 1094
    invoke-virtual {p0}, Lcom/localytics/android/AmpDialogFragment;->dismiss()V

    goto :goto_45

    :cond_97
    move v4, v5

    .line 1081
    goto :goto_91

    .line 1084
    :cond_99
    :try_start_99
    sget-boolean v4, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v4, :cond_ae

    .line 1086
    const-string v4, "Localytics"

    const-string v6, "[AMP Nav Handler]: Invalid url %s"

    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    aput-object p1, v7, v8

    invoke-static {v6, v7}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v4, v6}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1088
    :cond_ae
    invoke-virtual {p0}, Lcom/localytics/android/AmpDialogFragment;->dismiss()V
    :try_end_b1
    .catchall {:try_start_99 .. :try_end_b1} :catchall_b7

    .line 1092
    if-ne v2, v11, :cond_86

    .line 1094
    invoke-virtual {p0}, Lcom/localytics/android/AmpDialogFragment;->dismiss()V

    goto :goto_86

    .line 1092
    .end local v1    # "e":Ljava/lang/Exception;
    :catchall_b7
    move-exception v4

    if-ne v2, v11, :cond_bd

    .line 1094
    invoke-virtual {p0}, Lcom/localytics/android/AmpDialogFragment;->dismiss()V

    :cond_bd
    throw v4
.end method

.method public onActivityCreated(Landroid/os/Bundle;)V
    .registers 4
    .param p1, "arg0"    # Landroid/os/Bundle;

    .prologue
    .line 124
    sget-boolean v0, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v0, :cond_b

    .line 126
    const-string v0, "AmpDialogFragment"

    const-string v1, "onActivityCreated"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 128
    :cond_b
    invoke-super {p0, p1}, Landroid/support/v4/app/DialogFragment;->onActivityCreated(Landroid/os/Bundle;)V

    .line 129
    return-void
.end method

.method public onAttach(Landroid/app/Activity;)V
    .registers 4
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 134
    sget-boolean v0, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v0, :cond_b

    .line 136
    const-string v0, "AmpDialogFragment"

    const-string v1, "onAttach"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 138
    :cond_b
    invoke-super {p0, p1}, Landroid/support/v4/app/DialogFragment;->onAttach(Landroid/app/Activity;)V

    .line 139
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .registers 4
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 144
    sget-boolean v0, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v0, :cond_b

    .line 146
    const-string v0, "AmpDialogFragment"

    const-string v1, "onCreate"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 148
    :cond_b
    invoke-super {p0, p1}, Landroid/support/v4/app/DialogFragment;->onCreate(Landroid/os/Bundle;)V

    .line 149
    return-void
.end method

.method public onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
    .registers 5
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 277
    sget-boolean v0, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v0, :cond_b

    .line 279
    const-string v0, "AmpDialogFragment"

    const-string v1, "onCreateDialog"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 281
    :cond_b
    new-instance v0, Lcom/localytics/android/AmpDialogFragment$AmpDialog;

    invoke-virtual {p0}, Lcom/localytics/android/AmpDialogFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    const v2, 0x103000b

    invoke-direct {v0, p0, v1, v2}, Lcom/localytics/android/AmpDialogFragment$AmpDialog;-><init>(Lcom/localytics/android/AmpDialogFragment;Landroid/content/Context;I)V

    iput-object v0, p0, Lcom/localytics/android/AmpDialogFragment;->mAmpDialog:Lcom/localytics/android/AmpDialogFragment$AmpDialog;

    return-object v0
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .registers 6
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 257
    sget-boolean v0, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v0, :cond_b

    .line 259
    const-string v0, "AmpDialogFragment"

    const-string v1, "onCreateView"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 261
    :cond_b
    invoke-super {p0, p1, p2, p3}, Landroid/support/v4/app/DialogFragment;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public onDestroy()V
    .registers 5

    .prologue
    const/4 v3, 0x1

    .line 208
    sget-boolean v1, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v1, :cond_c

    .line 210
    const-string v1, "AmpDialogFragment"

    const-string v2, "onDestroy"

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 212
    :cond_c
    iget-object v1, p0, Lcom/localytics/android/AmpDialogFragment;->mCallbacks:Ljava/util/Map;

    if-eqz v1, :cond_2e

    .line 214
    iget-object v1, p0, Lcom/localytics/android/AmpDialogFragment;->mCallbacks:Ljava/util/Map;

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/localytics/android/AmpCallable;

    .line 215
    .local v0, "callable":Lcom/localytics/android/AmpCallable;
    invoke-static {}, Lcom/localytics/android/AmpConstants;->isTestModeEnabled()Z

    move-result v1

    if-nez v1, :cond_2e

    if-eqz v0, :cond_2e

    .line 217
    new-array v1, v3, [Ljava/lang/Object;

    const/4 v2, 0x0

    iget-object v3, p0, Lcom/localytics/android/AmpDialogFragment;->mAmpMessage:Ljava/util/Map;

    aput-object v3, v1, v2

    invoke-virtual {v0, v1}, Lcom/localytics/android/AmpCallable;->call([Ljava/lang/Object;)Ljava/lang/Object;

    .line 220
    .end local v0    # "callable":Lcom/localytics/android/AmpCallable;
    :cond_2e
    invoke-super {p0}, Landroid/support/v4/app/DialogFragment;->onDestroy()V

    .line 221
    return-void
.end method

.method public onDestroyView()V
    .registers 3

    .prologue
    .line 287
    sget-boolean v0, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v0, :cond_b

    .line 289
    const-string v0, "AmpDialogFragment"

    const-string v1, "onDestroyView"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 291
    :cond_b
    invoke-virtual {p0}, Lcom/localytics/android/AmpDialogFragment;->getDialog()Landroid/app/Dialog;

    move-result-object v0

    if-eqz v0, :cond_1f

    invoke-virtual {p0}, Lcom/localytics/android/AmpDialogFragment;->getRetainInstance()Z

    move-result v0

    if-eqz v0, :cond_1f

    .line 293
    invoke-virtual {p0}, Lcom/localytics/android/AmpDialogFragment;->getDialog()Landroid/app/Dialog;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/app/Dialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 295
    :cond_1f
    invoke-super {p0}, Landroid/support/v4/app/DialogFragment;->onDestroyView()V

    .line 296
    return-void
.end method

.method public onDetach()V
    .registers 3

    .prologue
    .line 154
    sget-boolean v0, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v0, :cond_b

    .line 156
    const-string v0, "AmpDialogFragment"

    const-string v1, "onDetach"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 158
    :cond_b
    invoke-super {p0}, Landroid/support/v4/app/DialogFragment;->onDetach()V

    .line 159
    return-void
.end method

.method public onDismiss(Landroid/content/DialogInterface;)V
    .registers 4
    .param p1, "dialog"    # Landroid/content/DialogInterface;

    .prologue
    .line 164
    sget-boolean v0, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v0, :cond_b

    .line 166
    const-string v0, "AmpDialogFragment"

    const-string v1, "onDismiss"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 168
    :cond_b
    iget-object v0, p0, Lcom/localytics/android/AmpDialogFragment;->mAmpMessage:Ljava/util/Map;

    if-eqz v0, :cond_14

    .line 170
    const-string v0, "X"

    invoke-direct {p0, v0}, Lcom/localytics/android/AmpDialogFragment;->tagAmpActionEventWithAction(Ljava/lang/String;)V

    .line 172
    :cond_14
    invoke-super {p0, p1}, Landroid/support/v4/app/DialogFragment;->onDismiss(Landroid/content/DialogInterface;)V

    .line 173
    return-void
.end method

.method public onPause()V
    .registers 3

    .prologue
    .line 188
    sget-boolean v0, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v0, :cond_b

    .line 190
    const-string v0, "AmpDialogFragment"

    const-string v1, "onPause"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 192
    :cond_b
    invoke-super {p0}, Landroid/support/v4/app/DialogFragment;->onPause()V

    .line 193
    return-void
.end method

.method public onResume()V
    .registers 3

    .prologue
    .line 198
    sget-boolean v0, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v0, :cond_b

    .line 200
    const-string v0, "AmpDialogFragment"

    const-string v1, "onResume"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 202
    :cond_b
    invoke-super {p0}, Landroid/support/v4/app/DialogFragment;->onResume()V

    .line 203
    return-void
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .registers 4
    .param p1, "arg0"    # Landroid/os/Bundle;

    .prologue
    .line 246
    sget-boolean v0, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v0, :cond_b

    .line 248
    const-string v0, "AmpDialogFragment"

    const-string v1, "onSaveInstanceState"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 250
    :cond_b
    invoke-super {p0, p1}, Landroid/support/v4/app/DialogFragment;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 251
    return-void
.end method

.method public onStart()V
    .registers 3

    .prologue
    .line 178
    sget-boolean v0, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v0, :cond_b

    .line 180
    const-string v0, "AmpDialogFragment"

    const-string v1, "onStart"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 182
    :cond_b
    invoke-super {p0}, Landroid/support/v4/app/DialogFragment;->onStart()V

    .line 183
    return-void
.end method

.method public onStop()V
    .registers 3

    .prologue
    .line 226
    sget-boolean v0, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v0, :cond_b

    .line 228
    const-string v0, "AmpDialogFragment"

    const-string v1, "onStop"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 230
    :cond_b
    invoke-super {p0}, Landroid/support/v4/app/DialogFragment;->onStop()V

    .line 231
    return-void
.end method

.method public onViewStateRestored(Landroid/os/Bundle;)V
    .registers 4
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 236
    sget-boolean v0, Lcom/localytics/android/Constants;->IS_LOGGABLE:Z

    if-eqz v0, :cond_b

    .line 238
    const-string v0, "AmpDialogFragment"

    const-string v1, "onViewStateRestored"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 240
    :cond_b
    invoke-super {p0, p1}, Landroid/support/v4/app/DialogFragment;->onViewStateRestored(Landroid/os/Bundle;)V

    .line 241
    return-void
.end method

.method public setCallbacks(Ljava/util/Map;)Lcom/localytics/android/AmpDialogFragment;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Integer;",
            "Lcom/localytics/android/AmpCallable;",
            ">;)",
            "Lcom/localytics/android/AmpDialogFragment;"
        }
    .end annotation

    .prologue
    .line 346
    .local p1, "callbacks":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/localytics/android/AmpCallable;>;"
    iput-object p1, p0, Lcom/localytics/android/AmpDialogFragment;->mCallbacks:Ljava/util/Map;

    .line 347
    return-object p0
.end method

.method public setData(Ljava/util/Map;)Lcom/localytics/android/AmpDialogFragment;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)",
            "Lcom/localytics/android/AmpDialogFragment;"
        }
    .end annotation

    .prologue
    .line 300
    .local p1, "ampMessage":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    iput-object p1, p0, Lcom/localytics/android/AmpDialogFragment;->mAmpMessage:Ljava/util/Map;

    .line 301
    return-object p0
.end method

.method public setJavaScriptClient(Lcom/localytics/android/JavaScriptClient;)Lcom/localytics/android/AmpDialogFragment;
    .registers 5
    .param p1, "javaScriptClient"    # Lcom/localytics/android/JavaScriptClient;

    .prologue
    .line 306
    iput-object p1, p0, Lcom/localytics/android/AmpDialogFragment;->mJavaScriptClient:Lcom/localytics/android/JavaScriptClient;

    .line 307
    iget-object v1, p0, Lcom/localytics/android/AmpDialogFragment;->mJavaScriptClient:Lcom/localytics/android/JavaScriptClient;

    invoke-virtual {v1}, Lcom/localytics/android/JavaScriptClient;->getCallbacks()Ljava/util/Map;

    move-result-object v0

    .line 309
    .local v0, "callbacks":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lcom/localytics/android/AmpCallable;>;"
    const/16 v1, 0xf

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    new-instance v2, Lcom/localytics/android/AmpDialogFragment$1;

    invoke-direct {v2, p0}, Lcom/localytics/android/AmpDialogFragment$1;-><init>(Lcom/localytics/android/AmpDialogFragment;)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 331
    const/4 v1, 0x4

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    new-instance v2, Lcom/localytics/android/AmpDialogFragment$2;

    invoke-direct {v2, p0}, Lcom/localytics/android/AmpDialogFragment$2;-><init>(Lcom/localytics/android/AmpDialogFragment;)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 341
    return-object p0
.end method
