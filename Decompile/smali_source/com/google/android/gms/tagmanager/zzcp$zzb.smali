.class Lcom/google/android/gms/tagmanager/zzcp$zzb;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/tagmanager/zzcp;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "zzb"
.end annotation


# instance fields
.field private zzaRP:Lcom/google/android/gms/tagmanager/zzbw;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/tagmanager/zzbw",
            "<",
            "Lcom/google/android/gms/internal/zzag$zza;",
            ">;"
        }
    .end annotation
.end field

.field private zzaRQ:Lcom/google/android/gms/internal/zzag$zza;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/tagmanager/zzbw;Lcom/google/android/gms/internal/zzag$zza;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/tagmanager/zzbw",
            "<",
            "Lcom/google/android/gms/internal/zzag$zza;",
            ">;",
            "Lcom/google/android/gms/internal/zzag$zza;",
            ")V"
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/tagmanager/zzcp$zzb;->zzaRP:Lcom/google/android/gms/tagmanager/zzbw;

    iput-object p2, p0, Lcom/google/android/gms/tagmanager/zzcp$zzb;->zzaRQ:Lcom/google/android/gms/internal/zzag$zza;

    return-void
.end method


# virtual methods
.method public getSize()I
    .registers 3

    iget-object v0, p0, Lcom/google/android/gms/tagmanager/zzcp$zzb;->zzaRP:Lcom/google/android/gms/tagmanager/zzbw;

    invoke-virtual {v0}, Lcom/google/android/gms/tagmanager/zzbw;->getObject()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzag$zza;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzag$zza;->zzDw()I

    move-result v1

    iget-object v0, p0, Lcom/google/android/gms/tagmanager/zzcp$zzb;->zzaRQ:Lcom/google/android/gms/internal/zzag$zza;

    if-nez v0, :cond_13

    const/4 v0, 0x0

    :goto_11
    add-int/2addr v0, v1

    return v0

    :cond_13
    iget-object v0, p0, Lcom/google/android/gms/tagmanager/zzcp$zzb;->zzaRQ:Lcom/google/android/gms/internal/zzag$zza;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzag$zza;->zzDw()I

    move-result v0

    goto :goto_11
.end method

.method public zzAH()Lcom/google/android/gms/tagmanager/zzbw;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/android/gms/tagmanager/zzbw",
            "<",
            "Lcom/google/android/gms/internal/zzag$zza;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/tagmanager/zzcp$zzb;->zzaRP:Lcom/google/android/gms/tagmanager/zzbw;

    return-object v0
.end method

.method public zzAI()Lcom/google/android/gms/internal/zzag$zza;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/tagmanager/zzcp$zzb;->zzaRQ:Lcom/google/android/gms/internal/zzag$zza;

    return-object v0
.end method
