.class Lcom/google/android/gms/internal/zzqr$1;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/gms/internal/zzqr;->zza(Ljava/lang/String;Ljava/lang/Integer;Lcom/google/android/gms/internal/zzql;Lcom/google/android/gms/internal/zzqq;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic zzaUi:Ljava/lang/String;

.field final synthetic zzaUj:Ljava/lang/Integer;

.field final synthetic zzaUk:Lcom/google/android/gms/internal/zzql;

.field final synthetic zzaUl:Lcom/google/android/gms/internal/zzqq;

.field final synthetic zzaUm:Lcom/google/android/gms/internal/zzqr;


# direct methods
.method constructor <init>(Lcom/google/android/gms/internal/zzqr;Ljava/lang/String;Ljava/lang/Integer;Lcom/google/android/gms/internal/zzql;Lcom/google/android/gms/internal/zzqq;)V
    .registers 6

    iput-object p1, p0, Lcom/google/android/gms/internal/zzqr$1;->zzaUm:Lcom/google/android/gms/internal/zzqr;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzqr$1;->zzaUi:Ljava/lang/String;

    iput-object p3, p0, Lcom/google/android/gms/internal/zzqr$1;->zzaUj:Ljava/lang/Integer;

    iput-object p4, p0, Lcom/google/android/gms/internal/zzqr$1;->zzaUk:Lcom/google/android/gms/internal/zzql;

    iput-object p5, p0, Lcom/google/android/gms/internal/zzqr$1;->zzaUl:Lcom/google/android/gms/internal/zzqq;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 6

    iget-object v0, p0, Lcom/google/android/gms/internal/zzqr$1;->zzaUm:Lcom/google/android/gms/internal/zzqr;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzqr$1;->zzaUi:Ljava/lang/String;

    iget-object v2, p0, Lcom/google/android/gms/internal/zzqr$1;->zzaUj:Ljava/lang/Integer;

    iget-object v3, p0, Lcom/google/android/gms/internal/zzqr$1;->zzaUk:Lcom/google/android/gms/internal/zzql;

    iget-object v4, p0, Lcom/google/android/gms/internal/zzqr$1;->zzaUl:Lcom/google/android/gms/internal/zzqq;

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/google/android/gms/internal/zzqr;->zzb(Ljava/lang/String;Ljava/lang/Integer;Lcom/google/android/gms/internal/zzql;Lcom/google/android/gms/internal/zzqq;)V

    return-void
.end method
