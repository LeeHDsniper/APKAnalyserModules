.class public final Lcom/google/android/gms/internal/zzgs;
.super Ljava/lang/Object;


# annotations
.annotation runtime Lcom/google/android/gms/internal/zzgk;
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/internal/zzgs$zza;
    }
.end annotation


# instance fields
.field private zzFX:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap",
            "<",
            "Landroid/content/Context;",
            "Lcom/google/android/gms/internal/zzgs$zza;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzgs;->zzFX:Ljava/util/WeakHashMap;

    return-void
.end method


# virtual methods
.method public zzD(Landroid/content/Context;)Lcom/google/android/gms/internal/zzgr;
    .registers 5

    iget-object v0, p0, Lcom/google/android/gms/internal/zzgs;->zzFX:Ljava/util/WeakHashMap;

    invoke-virtual {v0, p1}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzgs$zza;

    if-eqz v0, :cond_34

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzgs$zza;->hasExpired()Z

    move-result v1

    if-nez v1, :cond_34

    sget-object v1, Lcom/google/android/gms/internal/zzby;->zzuX:Lcom/google/android/gms/internal/zzbu;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzbu;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_34

    new-instance v1, Lcom/google/android/gms/internal/zzgr$zza;

    iget-object v0, v0, Lcom/google/android/gms/internal/zzgs$zza;->zzFZ:Lcom/google/android/gms/internal/zzgr;

    invoke-direct {v1, p1, v0}, Lcom/google/android/gms/internal/zzgr$zza;-><init>(Landroid/content/Context;Lcom/google/android/gms/internal/zzgr;)V

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzgr$zza;->zzfN()Lcom/google/android/gms/internal/zzgr;

    move-result-object v0

    :goto_29
    iget-object v1, p0, Lcom/google/android/gms/internal/zzgs;->zzFX:Ljava/util/WeakHashMap;

    new-instance v2, Lcom/google/android/gms/internal/zzgs$zza;

    invoke-direct {v2, p0, v0}, Lcom/google/android/gms/internal/zzgs$zza;-><init>(Lcom/google/android/gms/internal/zzgs;Lcom/google/android/gms/internal/zzgr;)V

    invoke-virtual {v1, p1, v2}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object v0

    :cond_34
    new-instance v0, Lcom/google/android/gms/internal/zzgr$zza;

    invoke-direct {v0, p1}, Lcom/google/android/gms/internal/zzgr$zza;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzgr$zza;->zzfN()Lcom/google/android/gms/internal/zzgr;

    move-result-object v0

    goto :goto_29
.end method
