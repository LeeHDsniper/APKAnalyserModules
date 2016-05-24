.class public Lcom/google/android/gms/tagmanager/zzax;
.super Ljava/lang/Object;


# static fields
.field private static zzaQo:Ljava/lang/String;

.field static zzaQp:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/google/android/gms/tagmanager/zzax;->zzaQp:Ljava/util/Map;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static zzF(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 4

    if-nez p1, :cond_b

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_9

    :goto_8
    return-object p0

    :cond_9
    const/4 p0, 0x0

    goto :goto_8

    :cond_b
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "http://hostname/?"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    goto :goto_8
.end method

.method public static zzeM(Ljava/lang/String;)V
    .registers 3

    const-class v1, Lcom/google/android/gms/tagmanager/zzax;

    monitor-enter v1

    :try_start_3
    sput-object p0, Lcom/google/android/gms/tagmanager/zzax;->zzaQo:Ljava/lang/String;

    monitor-exit v1

    return-void

    :catchall_7
    move-exception v0

    monitor-exit v1
    :try_end_9
    .catchall {:try_start_3 .. :try_end_9} :catchall_7

    throw v0
.end method

.method public static zzg(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 5

    sget-object v0, Lcom/google/android/gms/tagmanager/zzax;->zzaQp:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    if-nez v0, :cond_1e

    const-string v0, "gtm_click_referrers"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    if-eqz v0, :cond_23

    const-string v1, ""

    invoke-interface {v0, p1, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :goto_19
    sget-object v1, Lcom/google/android/gms/tagmanager/zzax;->zzaQp:Ljava/util/Map;

    invoke-interface {v1, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_1e
    invoke-static {v0, p2}, Lcom/google/android/gms/tagmanager/zzax;->zzF(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_23
    const-string v0, ""

    goto :goto_19
.end method

.method public static zzk(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;
    .registers 6

    sget-object v0, Lcom/google/android/gms/tagmanager/zzax;->zzaQo:Ljava/lang/String;

    if-nez v0, :cond_1f

    const-class v1, Lcom/google/android/gms/tagmanager/zzax;

    monitor-enter v1

    :try_start_7
    sget-object v0, Lcom/google/android/gms/tagmanager/zzax;->zzaQo:Ljava/lang/String;

    if-nez v0, :cond_1e

    const-string v0, "gtm_install_referrer"

    const/4 v2, 0x0

    invoke-virtual {p0, v0, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    if-eqz v0, :cond_26

    const-string v2, "referrer"

    const-string v3, ""

    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/google/android/gms/tagmanager/zzax;->zzaQo:Ljava/lang/String;

    :cond_1e
    :goto_1e
    monitor-exit v1
    :try_end_1f
    .catchall {:try_start_7 .. :try_end_1f} :catchall_2b

    :cond_1f
    sget-object v0, Lcom/google/android/gms/tagmanager/zzax;->zzaQo:Ljava/lang/String;

    invoke-static {v0, p1}, Lcom/google/android/gms/tagmanager/zzax;->zzF(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_26
    :try_start_26
    const-string v0, ""

    sput-object v0, Lcom/google/android/gms/tagmanager/zzax;->zzaQo:Ljava/lang/String;

    goto :goto_1e

    :catchall_2b
    move-exception v0

    monitor-exit v1
    :try_end_2d
    .catchall {:try_start_26 .. :try_end_2d} :catchall_2b

    throw v0
.end method

.method public static zzl(Landroid/content/Context;Ljava/lang/String;)V
    .registers 4

    const-string v0, "conv"

    invoke-static {p1, v0}, Lcom/google/android/gms/tagmanager/zzax;->zzF(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_18

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_18

    sget-object v1, Lcom/google/android/gms/tagmanager/zzax;->zzaQp:Ljava/util/Map;

    invoke-interface {v1, v0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "gtm_click_referrers"

    invoke-static {p0, v1, v0, p1}, Lcom/google/android/gms/tagmanager/zzcv;->zzb(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    :cond_18
    return-void
.end method
