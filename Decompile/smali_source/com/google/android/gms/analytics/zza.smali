.class public Lcom/google/android/gms/analytics/zza;
.super Lcom/google/android/gms/internal/zzoe;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/android/gms/internal/zzoe",
        "<",
        "Lcom/google/android/gms/analytics/zza;",
        ">;"
    }
.end annotation


# instance fields
.field private final zzKa:Lcom/google/android/gms/analytics/internal/zzf;

.field private zzKb:Z


# direct methods
.method public constructor <init>(Lcom/google/android/gms/analytics/internal/zzf;)V
    .registers 4

    invoke-virtual {p1}, Lcom/google/android/gms/analytics/internal/zzf;->zzig()Lcom/google/android/gms/internal/zzof;

    move-result-object v0

    invoke-virtual {p1}, Lcom/google/android/gms/analytics/internal/zzf;->zzid()Lcom/google/android/gms/internal/zzlm;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/google/android/gms/internal/zzoe;-><init>(Lcom/google/android/gms/internal/zzof;Lcom/google/android/gms/internal/zzlm;)V

    iput-object p1, p0, Lcom/google/android/gms/analytics/zza;->zzKa:Lcom/google/android/gms/analytics/internal/zzf;

    return-void
.end method


# virtual methods
.method public enableAdvertisingIdCollection(Z)V
    .registers 2
    .param p1, "enable"    # Z

    .prologue
    iput-boolean p1, p0, Lcom/google/android/gms/analytics/zza;->zzKb:Z

    return-void
.end method

.method protected zza(Lcom/google/android/gms/internal/zzob;)V
    .registers 5

    const-class v0, Lcom/google/android/gms/internal/zzjb;

    invoke-virtual {p1, v0}, Lcom/google/android/gms/internal/zzob;->zze(Ljava/lang/Class;)Lcom/google/android/gms/internal/zzod;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzjb;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzjb;->getClientId()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_1f

    iget-object v1, p0, Lcom/google/android/gms/analytics/zza;->zzKa:Lcom/google/android/gms/analytics/internal/zzf;

    invoke-virtual {v1}, Lcom/google/android/gms/analytics/internal/zzf;->zziv()Lcom/google/android/gms/analytics/internal/zzn;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/analytics/internal/zzn;->zzjd()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzjb;->setClientId(Ljava/lang/String;)V

    :cond_1f
    iget-boolean v1, p0, Lcom/google/android/gms/analytics/zza;->zzKb:Z

    if-eqz v1, :cond_41

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzjb;->zzhL()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_41

    iget-object v1, p0, Lcom/google/android/gms/analytics/zza;->zzKa:Lcom/google/android/gms/analytics/internal/zzf;

    invoke-virtual {v1}, Lcom/google/android/gms/analytics/internal/zzf;->zziu()Lcom/google/android/gms/analytics/internal/zza;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/analytics/internal/zza;->zzhQ()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/google/android/gms/internal/zzjb;->zzaT(Ljava/lang/String;)V

    invoke-virtual {v1}, Lcom/google/android/gms/analytics/internal/zza;->zzhM()Z

    move-result v1

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzjb;->zzG(Z)V

    :cond_41
    return-void
.end method

.method public zzaN(Ljava/lang/String;)V
    .registers 5

    invoke-static {p1}, Lcom/google/android/gms/common/internal/zzx;->zzcs(Ljava/lang/String;)Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/google/android/gms/analytics/zza;->zzaO(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/zza;->zzxt()Ljava/util/List;

    move-result-object v0

    new-instance v1, Lcom/google/android/gms/analytics/zzb;

    iget-object v2, p0, Lcom/google/android/gms/analytics/zza;->zzKa:Lcom/google/android/gms/analytics/internal/zzf;

    invoke-direct {v1, v2, p1}, Lcom/google/android/gms/analytics/zzb;-><init>(Lcom/google/android/gms/analytics/internal/zzf;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public zzaO(Ljava/lang/String;)V
    .registers 5

    invoke-static {p1}, Lcom/google/android/gms/analytics/zzb;->zzaP(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/zza;->zzxt()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->listIterator()Ljava/util/ListIterator;

    move-result-object v2

    :cond_c
    :goto_c
    invoke-interface {v2}, Ljava/util/ListIterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_26

    invoke-interface {v2}, Ljava/util/ListIterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzoh;

    invoke-interface {v0}, Lcom/google/android/gms/internal/zzoh;->zzhs()Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/net/Uri;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_c

    invoke-interface {v2}, Ljava/util/ListIterator;->remove()V

    goto :goto_c

    :cond_26
    return-void
.end method

.method zzhp()Lcom/google/android/gms/analytics/internal/zzf;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/analytics/zza;->zzKa:Lcom/google/android/gms/analytics/internal/zzf;

    return-object v0
.end method

.method public zzhq()Lcom/google/android/gms/internal/zzob;
    .registers 3

    invoke-virtual {p0}, Lcom/google/android/gms/analytics/zza;->zzxs()Lcom/google/android/gms/internal/zzob;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzob;->zzxh()Lcom/google/android/gms/internal/zzob;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/analytics/zza;->zzKa:Lcom/google/android/gms/analytics/internal/zzf;

    invoke-virtual {v1}, Lcom/google/android/gms/analytics/internal/zzf;->zzil()Lcom/google/android/gms/analytics/internal/zzk;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/analytics/internal/zzk;->zziL()Lcom/google/android/gms/internal/zzok;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzob;->zzb(Lcom/google/android/gms/internal/zzod;)V

    iget-object v1, p0, Lcom/google/android/gms/analytics/zza;->zzKa:Lcom/google/android/gms/analytics/internal/zzf;

    invoke-virtual {v1}, Lcom/google/android/gms/analytics/internal/zzf;->zzim()Lcom/google/android/gms/analytics/internal/zzu;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/gms/analytics/internal/zzu;->zzjS()Lcom/google/android/gms/internal/zzom;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzob;->zzb(Lcom/google/android/gms/internal/zzod;)V

    invoke-virtual {p0, v0}, Lcom/google/android/gms/analytics/zza;->zzd(Lcom/google/android/gms/internal/zzob;)V

    return-object v0
.end method
