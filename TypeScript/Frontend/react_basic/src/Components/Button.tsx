import React from "react";

interface btnProps {
  apiHit: (event: React.MouseEvent<HTMLButtonElement>) => void;
}
function Button(props: btnProps) {
  return (
    <div>
      <button onClick={(event) => props.apiHit(event)}>Events Button1</button>
    </div>
  );
}

export default Button;
