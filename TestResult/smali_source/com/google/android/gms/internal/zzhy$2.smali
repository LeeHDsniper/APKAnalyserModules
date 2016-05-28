.class Lcom/google/android/gms/internal/zzhy$2;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/internal/zzm$zza;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzhy;->zzb(Ljava/lang/String;Ljava/util/Map;)Lcom/google/android/gms/internal/zzih;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic zzIh:Lcom/google/android/gms/internal/zzhy$zzc;

.field final synthetic zzIi:Lcom/google/android/gms/internal/zzhy;

.field final synthetic zzxv:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzhy;Ljava/lang/String;Lcom/google/android/gms/internal/zzhy$zzc;)V
    .registers 4

    iput-object p1, p0, Lcom/google/android/gms/internal/zzhy$2;->zzIi:Lcom/google/android/gms/internal/zzhy;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzhy$2;->zzxv:Ljava/lang/String;

    iput-object p3, p0, Lcom/google/android/gms/internal/zzhy$2;->zzIh:Lcom/google/android/gms/internal/zzhy$zzc;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public zze(Lcom/google/android/gms/internal/zzr;)V
    .registers 4

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Failed to load URL: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzhy$2;->zzxv:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzr;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/client/zzb;->zzaE(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/google/android/gms/internal/zzhy$2;->zzIh:Lcom/google/android/gms/internal/zzhy$zzc;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzhy$zzc;->zzb(Ljava/lang/Object;)V

    return-void
.end method
