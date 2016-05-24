.class Lcom/google/android/gms/common/api/zzi$1;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/common/api/zzi$zzd;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/common/api/zzi;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic zzaap:Lcom/google/android/gms/common/api/zzi;


# direct methods
.method constructor <init>(Lcom/google/android/gms/common/api/zzi;)V
    .registers 2

    iput-object p1, p0, Lcom/google/android/gms/common/api/zzi$1;->zzaap:Lcom/google/android/gms/common/api/zzi;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public zzc(Lcom/google/android/gms/common/api/zzi$zze;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/common/api/zzi$zze",
            "<*>;)V"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/common/api/zzi$1;->zzaap:Lcom/google/android/gms/common/api/zzi;

    iget-object v0, v0, Lcom/google/android/gms/common/api/zzi;->zzaal:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    return-void
.end method
