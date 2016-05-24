.class Lcom/google/android/gms/tagmanager/zzd;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/tagmanager/DataLayer$zzb;


# instance fields
.field private final context:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/tagmanager/zzd;->context:Landroid/content/Context;

    return-void
.end method


# virtual methods
.method public zzH(Ljava/util/Map;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    const-string v0, "gtm.url"

    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-nez v1, :cond_37

    const-string v0, "gtm"

    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_37

    instance-of v2, v0, Ljava/util/Map;

    if-eqz v2, :cond_37

    check-cast v0, Ljava/util/Map;

    const-string v1, "url"

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    :goto_1c
    if-eqz v0, :cond_22

    instance-of v1, v0, Ljava/lang/String;

    if-nez v1, :cond_23

    :cond_22
    :goto_22
    return-void

    :cond_23
    check-cast v0, Ljava/lang/String;

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    const-string v1, "referrer"

    invoke-virtual {v0, v1}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_22

    iget-object v1, p0, Lcom/google/android/gms/tagmanager/zzd;->context:Landroid/content/Context;

    invoke-static {v1, v0}, Lcom/google/android/gms/tagmanager/zzax;->zzl(Landroid/content/Context;Ljava/lang/String;)V

    goto :goto_22

    :cond_37
    move-object v0, v1

    goto :goto_1c
.end method
