.class public Lcom/facebook/ads/internal/dto/f;
.super Ljava/lang/Object;


# static fields
.field public static final a:Ljava/lang/String;

.field public static b:Ljava/lang/String;

.field public static c:Ljava/lang/String;

.field public static d:Ljava/lang/String;

.field public static e:Ljava/lang/String;

.field public static f:Ljava/lang/String;

.field public static g:I

.field public static h:Ljava/lang/String;

.field public static i:I

.field public static j:Ljava/lang/String;

.field public static k:I

.field public static l:Ljava/lang/String;

.field public static m:Ljava/lang/String;

.field public static n:Ljava/lang/String;

.field public static o:Z

.field private static p:Z


# direct methods
.method static constructor <clinit>()V
    .registers 2

    const/4 v1, 0x0

    sput-boolean v1, Lcom/facebook/ads/internal/dto/f;->p:Z

    sget-object v0, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    sput-object v0, Lcom/facebook/ads/internal/dto/f;->a:Ljava/lang/String;

    const-string v0, ""

    sput-object v0, Lcom/facebook/ads/internal/dto/f;->b:Ljava/lang/String;

    const-string v0, ""

    sput-object v0, Lcom/facebook/ads/internal/dto/f;->c:Ljava/lang/String;

    const-string v0, ""

    sput-object v0, Lcom/facebook/ads/internal/dto/f;->d:Ljava/lang/String;

    const-string v0, ""

    sput-object v0, Lcom/facebook/ads/internal/dto/f;->e:Ljava/lang/String;

    const-string v0, ""

    sput-object v0, Lcom/facebook/ads/internal/dto/f;->f:Ljava/lang/String;

    sput v1, Lcom/facebook/ads/internal/dto/f;->g:I

    const-string v0, ""

    sput-object v0, Lcom/facebook/ads/internal/dto/f;->h:Ljava/lang/String;

    sput v1, Lcom/facebook/ads/internal/dto/f;->i:I

    const-string v0, ""

    sput-object v0, Lcom/facebook/ads/internal/dto/f;->j:Ljava/lang/String;

    sput v1, Lcom/facebook/ads/internal/dto/f;->k:I

    const-string v0, ""

    sput-object v0, Lcom/facebook/ads/internal/dto/f;->l:Ljava/lang/String;

    const-string v0, ""

    sput-object v0, Lcom/facebook/ads/internal/dto/f;->m:Ljava/lang/String;

    const-string v0, ""

    sput-object v0, Lcom/facebook/ads/internal/dto/f;->n:Ljava/lang/String;

    sput-boolean v1, Lcom/facebook/ads/internal/dto/f;->o:Z

    return-void
.end method

.method public static declared-synchronized a(Landroid/content/Context;)V
    .registers 3

    const-class v1, Lcom/facebook/ads/internal/dto/f;

    monitor-enter v1

    :try_start_3
    sget-boolean v0, Lcom/facebook/ads/internal/dto/f;->p:Z

    if-nez v0, :cond_d

    const/4 v0, 0x1

    sput-boolean v0, Lcom/facebook/ads/internal/dto/f;->p:Z

    invoke-static {p0}, Lcom/facebook/ads/internal/dto/f;->c(Landroid/content/Context;)V

    :cond_d
    invoke-static {p0}, Lcom/facebook/ads/internal/dto/f;->d(Landroid/content/Context;)V
    :try_end_10
    .catchall {:try_start_3 .. :try_end_10} :catchall_12

    monitor-exit v1

    return-void

    :catchall_12
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public static b(Landroid/content/Context;)V
    .registers 5

    const/4 v1, 0x0

    sget-boolean v0, Lcom/facebook/ads/internal/dto/f;->p:Z

    if-nez v0, :cond_6

    :goto_5
    return-void

    :cond_6
    :try_start_6
    const-string v0, "SDKIDFA"

    const/4 v2, 0x0

    invoke-virtual {p0, v0, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v2

    const-string v0, "attributionId"

    invoke-interface {v2, v0}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1f

    const-string v0, "attributionId"

    const-string v3, ""

    invoke-interface {v2, v0, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/facebook/ads/internal/dto/f;->m:Ljava/lang/String;

    :cond_1f
    const-string v0, "advertisingId"

    invoke-interface {v2, v0}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3b

    const-string v0, "advertisingId"

    const-string v3, ""

    invoke-interface {v2, v0, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/facebook/ads/internal/dto/f;->n:Ljava/lang/String;

    const-string v0, "limitAdTracking"

    sget-boolean v3, Lcom/facebook/ads/internal/dto/f;->o:Z

    invoke-interface {v2, v0, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    sput-boolean v0, Lcom/facebook/ads/internal/dto/f;->o:Z
    :try_end_3b
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_3b} :catch_84

    :cond_3b
    :try_start_3b
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    invoke-static {v0}, Lcom/facebook/ads/internal/util/g;->a(Landroid/content/ContentResolver;)Lcom/facebook/ads/internal/util/g$a;
    :try_end_42
    .catch Ljava/lang/Exception; {:try_start_3b .. :try_end_42} :catch_8a

    move-result-object v0

    :goto_43
    if-eqz v0, :cond_4b

    :try_start_45
    iget-object v3, v0, Lcom/facebook/ads/internal/util/g$a;->a:Ljava/lang/String;

    if-eqz v3, :cond_4b

    sput-object v3, Lcom/facebook/ads/internal/dto/f;->m:Ljava/lang/String;
    :try_end_4b
    .catch Ljava/lang/Exception; {:try_start_45 .. :try_end_4b} :catch_84

    :cond_4b
    :try_start_4b
    invoke-static {p0, v0}, Lcom/facebook/ads/internal/f;->a(Landroid/content/Context;Lcom/facebook/ads/internal/util/g$a;)Lcom/facebook/ads/internal/f;
    :try_end_4e
    .catch Ljava/lang/Exception; {:try_start_4b .. :try_end_4e} :catch_96

    move-result-object v0

    :goto_4f
    if-eqz v0, :cond_67

    :try_start_51
    invoke-virtual {v0}, Lcom/facebook/ads/internal/f;->a()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0}, Lcom/facebook/ads/internal/f;->b()Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    if-eqz v1, :cond_67

    sput-object v1, Lcom/facebook/ads/internal/dto/f;->n:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    sput-boolean v0, Lcom/facebook/ads/internal/dto/f;->o:Z

    :cond_67
    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "attributionId"

    sget-object v2, Lcom/facebook/ads/internal/dto/f;->m:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    const-string v1, "advertisingId"

    sget-object v2, Lcom/facebook/ads/internal/dto/f;->n:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    const-string v1, "limitAdTracking"

    sget-boolean v2, Lcom/facebook/ads/internal/dto/f;->o:Z

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V
    :try_end_83
    .catch Ljava/lang/Exception; {:try_start_51 .. :try_end_83} :catch_84

    goto :goto_5

    :catch_84
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto/16 :goto_5

    :catch_8a
    move-exception v0

    :try_start_8b
    const-string v3, "Error retrieving attribution id from fb4a"

    invoke-static {v0, v3}, Lcom/facebook/ads/internal/util/b;->a(Ljava/lang/Throwable;Ljava/lang/String;)Lcom/facebook/ads/internal/util/b;

    move-result-object v0

    invoke-static {v0}, Lcom/facebook/ads/internal/util/c;->a(Lcom/facebook/ads/internal/util/b;)V

    move-object v0, v1

    goto :goto_43

    :catch_96
    move-exception v0

    const-string v3, "Error retrieving advertising id from Google Play Services"

    invoke-static {v0, v3}, Lcom/facebook/ads/internal/util/b;->a(Ljava/lang/Throwable;Ljava/lang/String;)Lcom/facebook/ads/internal/util/b;

    move-result-object v0

    invoke-static {v0}, Lcom/facebook/ads/internal/util/c;->a(Lcom/facebook/ads/internal/util/b;)V
    :try_end_a0
    .catch Ljava/lang/Exception; {:try_start_8b .. :try_end_a0} :catch_84

    move-object v0, v1

    goto :goto_4f
.end method

.method private static c(Landroid/content/Context;)V
    .registers 4

    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    :try_start_4
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v1

    iget-object v2, v1, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    sput-object v2, Lcom/facebook/ads/internal/dto/f;->d:Ljava/lang/String;

    iget-object v2, v1, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;

    sput-object v2, Lcom/facebook/ads/internal/dto/f;->f:Ljava/lang/String;

    iget v1, v1, Landroid/content/pm/PackageInfo;->versionCode:I

    sput v1, Lcom/facebook/ads/internal/dto/f;->g:I
    :try_end_19
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_4 .. :try_end_19} :catch_69

    :goto_19
    :try_start_19
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/pm/PackageManager;->getApplicationLabel(Landroid/content/pm/ApplicationInfo;)Ljava/lang/CharSequence;

    move-result-object v0

    if-eqz v0, :cond_34

    invoke-interface {v0}, Ljava/lang/CharSequence;->length()I

    move-result v1

    if-lez v1, :cond_34

    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/facebook/ads/internal/dto/f;->e:Ljava/lang/String;
    :try_end_34
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_19 .. :try_end_34} :catch_67

    :cond_34
    :goto_34
    const-string v0, "phone"

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/telephony/TelephonyManager;

    if-eqz v0, :cond_4c

    invoke-virtual {v0}, Landroid/telephony/TelephonyManager;->getNetworkOperatorName()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_4c

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_4c

    sput-object v0, Lcom/facebook/ads/internal/dto/f;->h:Ljava/lang/String;

    :cond_4c
    sget-object v0, Landroid/os/Build;->MANUFACTURER:Ljava/lang/String;

    if-eqz v0, :cond_58

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_58

    sput-object v0, Lcom/facebook/ads/internal/dto/f;->b:Ljava/lang/String;

    :cond_58
    sget-object v0, Landroid/os/Build;->MODEL:Ljava/lang/String;

    if-eqz v0, :cond_66

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_66

    sget-object v0, Landroid/os/Build;->MODEL:Ljava/lang/String;

    sput-object v0, Lcom/facebook/ads/internal/dto/f;->c:Ljava/lang/String;

    :cond_66
    return-void

    :catch_67
    move-exception v0

    goto :goto_34

    :catch_69
    move-exception v1

    goto :goto_19
.end method

.method private static d(Landroid/content/Context;)V
    .registers 3

    :try_start_0
    const-string v0, "connectivity"

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    invoke-virtual {v0}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v0

    if-eqz v0, :cond_2c

    invoke-virtual {v0}, Landroid/net/NetworkInfo;->isConnectedOrConnecting()Z

    move-result v1

    if-eqz v1, :cond_2c

    invoke-virtual {v0}, Landroid/net/NetworkInfo;->getType()I

    move-result v1

    sput v1, Lcom/facebook/ads/internal/dto/f;->i:I

    invoke-virtual {v0}, Landroid/net/NetworkInfo;->getTypeName()Ljava/lang/String;

    move-result-object v1

    sput-object v1, Lcom/facebook/ads/internal/dto/f;->j:Ljava/lang/String;

    invoke-virtual {v0}, Landroid/net/NetworkInfo;->getSubtype()I

    move-result v1

    sput v1, Lcom/facebook/ads/internal/dto/f;->k:I

    invoke-virtual {v0}, Landroid/net/NetworkInfo;->getSubtypeName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/facebook/ads/internal/dto/f;->l:Ljava/lang/String;
    :try_end_2c
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_2c} :catch_2d

    :cond_2c
    :goto_2c
    return-void

    :catch_2d
    move-exception v0

    goto :goto_2c
.end method
